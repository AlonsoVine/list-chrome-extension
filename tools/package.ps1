# Requires: PowerShell 5+
# Empaqueta la extensión validando iconos y estructura.
# Uso:  pwsh ./tools/package.ps1 [-OutDir build]

param(
  [string]$OutDir = "build"
)

$ErrorActionPreference = 'Stop'

function Write-Info($msg){ Write-Host "[INFO] $msg" -ForegroundColor Cyan }
function Write-Warn($msg){ Write-Host "[WARN] $msg" -ForegroundColor Yellow }
function Write-Err($msg){ Write-Host "[ERROR] $msg" -ForegroundColor Red }

# 1) Localiza la raíz del proyecto (donde está este script)
$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$Root = Resolve-Path (Join-Path $ScriptDir '..')
Set-Location $Root
Write-Info "Raíz del proyecto: $Root"

# 2) Lee manifest.json
if(!(Test-Path 'manifest.json')){ Write-Err 'No se encontró manifest.json'; exit 1 }
$manifestText = Get-Content -Raw -Encoding UTF8 'manifest.json'
$manifest = $manifestText | ConvertFrom-Json

$name = $manifest.name
$version = $manifest.version
if(-not $version){ Write-Err 'manifest.version no definido'; exit 1 }
Write-Info "Extensión: $name v$version"

# 3) Validaciones básicas
if(-not (Test-Path 'index.html')){ Write-Err 'Falta index.html (popup)'; exit 1 }

# Iconos requeridos
$requiredSizes = 16,32,48,128
$iconErrors = @()

function Test-Icon($map){
  foreach($s in $requiredSizes){
    $path = $map.$s
    if(-not $path){ $iconErrors += "Falta ruta para icono $s en manifest"; continue }
    if(-not (Test-Path $path)) { $iconErrors += "No existe el icono $s en '$path'"; continue }
    try {
      # Comprueba dimensiones si System.Drawing está disponible
      Add-Type -AssemblyName System.Drawing -ErrorAction SilentlyContinue | Out-Null
      if([System.Drawing.Image]){
        $img = [System.Drawing.Image]::FromFile((Resolve-Path $path))
        if($img.Width -ne $s -or $img.Height -ne $s){ $iconErrors += "Icono $path no es ${s}x${s} (es ${($img.Width)}x${($img.Height)})" }
        $img.Dispose()
      }
    } catch {
      Write-Warn "No se pudieron validar dimensiones de '$path': $($_.Exception.Message)"
    }
  }
}

if($manifest.icons){ Test-Icon $manifest.icons } else { $iconErrors += 'Sección icons ausente en manifest' }
if($manifest.action -and $manifest.action.default_icon){ Test-Icon $manifest.action.default_icon } else { $iconErrors += 'action.default_icon ausente en manifest' }

if($iconErrors.Count -gt 0){
  Write-Err ("Problemas con iconos:`n - " + ($iconErrors -join "`n - "))
  exit 1
}

# 4) Preparar carpeta de salida
New-Item -Type Directory -Force $OutDir | Out-Null
$zipName = ("{0}-{1}.zip" -f ($name -replace '\s+','-').ToLower(), $version)
$zipPath = Join-Path $OutDir $zipName
if(Test-Path $zipPath){ Remove-Item -Force $zipPath }

# 5) Crear ZIP con contenido mínimo necesario
$paths = @('manifest.json','index.html','assets')
Write-Info "Empaquetando → $zipPath"
Compress-Archive -Path $paths -DestinationPath $zipPath -Force

# 6) Resultado
Get-Item $zipPath | Select-Object FullName, Length | Format-List
Write-Host "Listo. Sube el ZIP al Developer Dashboard." -ForegroundColor Green

