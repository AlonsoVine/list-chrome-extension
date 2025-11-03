# 📝 Lista de tareas — Extensión Chrome (MV3)

Pequeño popup para gestionar tareas reutilizando tu `assets/js/script.js` sin cambios. Usa HTML y CSS locales, sin JS inline.

## 🚀 Instalación rápida
- 🔧 Abre `chrome://extensions` → activa «Modo desarrollador».
- 📂 Clic en «Cargar descomprimida» y selecciona `chrome-extension/`.
- 🖼️ Si Chrome muestra error de iconos, asegúrate de tener estos PNG:
  - `assets/img/icon16.png`, `icon32.png`, `icon48.png`, `icon128.png`.
  - Puedes exportarlos desde `assets/img/list-svgrepo-com.svg` (ver abajo) o apuntar todas las claves a un único PNG temporal.

## 📁 Estructura
- 🧭 `manifest.json` → declara popup `index.html` y permisos `storage`.
- 🪟 `index.html` → maquetación accesible (IDs intactos: `#formTarea`, `#nombreTarea`, `#listaTareas`).
- 🎨 `assets/css/style.css` → estilos compactos y modernos basados en variables.
- ⚙️ `assets/js/script.js` → lógica original, sin modificaciones.
- 🖼️ `assets/img/` → icono SVG base y PNGs de la extensión.

## 🎨 Paleta y tokens (coherencia visual)
Paleta usada en el popup mediante variables CSS. Los tonos aquí son los de tu proyecto:

- <span style="display:inline-block;width:12px;height:12px;background:#799EFF;border-radius:3px;border:1px solid #0002;"></span> `--primer-color: #799EFF` (primario)
- <span style="display:inline-block;width:12px;height:12px;background:#FEFFC4;border-radius:3px;border:1px solid #0002;"></span> `--segundo-color: #FEFFC4` (fondo base)
- <span style="display:inline-block;width:12px;height:12px;background:#FFDE63;border-radius:3px;border:1px solid #0002;"></span> `--tercero-color: #FFDE63` (acento)
- <span style="display:inline-block;width:12px;height:12px;background:#FFBC4C;border-radius:3px;border:1px solid #0002;"></span> `--cuarto-color: #FFBC4C` (borde/contraste)

Tokens de layout (en `assets/css/style.css`): `--radius: 12px`, `--gap-1: 8px`, `--gap-2: 12px`, `--gap-3: 16px`.

## 📐 Tamaño del popup
- ↔️ Ancho: `clamp(380px, 92vw, 420px)`
- ↕️ Alto mínimo: `520px`

## 🧰 Generar iconos desde el SVG
Usa Inkscape (ejemplos Windows/macOS/Linux):
```
inkscape assets/img/list-svgrepo-com.svg -w 16  -h 16  -o chrome-extension/assets/img/icon16.png
inkscape assets/img/list-svgrepo-com.svg -w 32  -h 32  -o chrome-extension/assets/img/icon32.png
inkscape assets/img/list-svgrepo-com.svg -w 48  -h 48  -o chrome-extension/assets/img/icon48.png
inkscape assets/img/list-svgrepo-com.svg -w 128 -h 128 -o chrome-extension/assets/img/icon128.png
```
Temporalmente puedes reutilizar un único PNG y referenciarlo en todas las claves del `manifest.json`.

## ℹ️ Notas
- ✅ No hay JS/CSS inline; todo es local.
- ✏️ Cualquier ajuste visual se recomienda hacerlo cambiando las variables CSS para mantener coherencia con la paleta.
"# list-chrome-extension" 
