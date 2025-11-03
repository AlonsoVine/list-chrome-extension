# 📝 Lista de tareas — Extensión Chrome (MV3)

Popup compacto para añadir y gestionar tareas al vuelo. Sin cuentas. Hecho en HTML/CSS/JS (Manifest V3) y usando `localStorage` para persistencia.

## ✨ Características
- ➕ Añadir y ➖ eliminar tareas de forma sencilla.
- 💾 Persistencia local (sin servidores ni registros).
- ♿ Popup accesible y responsive.
- 🎨 Paleta coherente y personalizable desde `assets/css/style.css`.

## 🚀 Instalación (modo desarrollador)
1) 🔧 Abre `chrome://extensions` y activa “Modo desarrollador”.
2) 📂 Clic en “Cargar descomprimida” y selecciona la carpeta del proyecto.
3) 📌 Fija la extensión en la barra y abre el popup.

ℹ️ Si aparece un error de iconos, verifica que existen estos PNG (declarados en `manifest.json`):
- 🖼️ `assets/img/icon16.png`, `icon32.png`, `icon48.png`, `icon128.png`.

## 🧱 Estructura del proyecto
- 🧭 `manifest.json` → declara el popup `index.html`, iconos y permisos (`storage`).
- 🪟 `index.html` → maquetación del popup (IDs: `#formTarea`, `#nombreTarea`, `#listaTareas`).
- 🎨 `assets/css/style.css` → estilos modernos (variables y overrides documentados).
- ⚙️ `assets/js/script.js` → lógica original (DOM + localStorage).
- 🖼️ `assets/img/` → iconos e imágenes de la extensión.

## 🎨 Paleta y tokens
Variables principales (ajústalas en `assets/css/style.css`):
- 🎯 `--primer-color` (primario), `--segundo-color` (fondo), `--tercero-color` (acento), `--cuarto-color` (contraste)
- 📏 Tokens: `--radius: 12px`, `--gap-1: 8px`, `--gap-2: 12px`, `--gap-3: 16px`

## 🧰 Generar iconos desde el SVG
Con Inkscape (Windows/macOS/Linux):
```
inkscape assets/img/list-svgrepo-com.svg -w 16  -h 16  -o assets/img/icon16.png
inkscape assets/img/list-svgrepo-com.svg -w 32  -h 32  -o assets/img/icon32.png
inkscape assets/img/list-svgrepo-com.svg -w 48  -h 48  -o assets/img/icon48.png
inkscape assets/img/list-svgrepo-com.svg -w 128 -h 128 -o assets/img/icon128.png
```

## 🛍️ Publicación en Chrome Web Store (resumen)
- 📦 Empaqueta un ZIP con el contenido del proyecto (sin `.git` ni `build/`).
- 🖼️ Asegura iconos 16/32/48/128 declarados y válidos.
- 📝 Redacta descripción corta y larga y añade 2–4 capturas (1280×800).
- 🔒 “Privacy practices”: no se recopilan datos (usa `localStorage`).
- 🚀 Sube el ZIP, completa la ficha y envía a revisión. Recuerda subir `version` en cada release.

## 👤 Autor
- Alonso Viñé Barrancos
- 🌐 Portfolio: https://alonsovine.github.io/portfolio/
- 💼 LinkedIn: https://www.linkedin.com/in/alonso-viñé-barrancos
