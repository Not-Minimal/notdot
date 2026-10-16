# 🎯 Neovim Cheat Sheet - Guía Completa

> El leader es `<Space>`. Presiona `<Space>` y espera: which-key muestra todos los grupos.

## 📋 Índice
- [Navegación](#-navegación)
- [Edición](#️-edición)
- [Textobjects y Surround](#-textobjects-y-surround)
- [Búsqueda y Reemplazo](#-búsqueda-y-reemplazo)
- [Buscar Archivos y Texto (fff)](#-buscar-archivos-y-texto-fff)
- [Ventanas](#-ventanas)
- [Explorador de Archivos](#-explorador-de-archivos)
- [Git](#-git)
- [LSP](#-lsp)
- [Diagnósticos](#-diagnósticos)
- [Depuración (DAP)](#-depuración-dap)
- [Tests (neotest)](#-tests-neotest)
- [Autocompletado e IA](#-autocompletado-e-ia)
- [Formato](#-formato)
- [Dashboard](#-dashboard)
- [Clipboard](#-clipboard-macos)
- [Plugins](#-plugins)

---

## 🔍 Navegación

### Movimiento Básico
| Comando | Descripción |
|---------|-------------|
| `h`, `j`, `k`, `l` | Mover izquierda, abajo, arriba, derecha |
| `w` / `b` / `e` | Siguiente palabra / anterior / final de palabra |
| `0` / `$` | Inicio / final de línea |
| `gg` / `G` | Inicio / final del archivo |
| `Ctrl+d` / `Ctrl+u` | Media pantalla abajo / arriba |
| `Ctrl+f` / `Ctrl+b` | Pantalla completa abajo / arriba |
| `{` / `}` | Párrafo anterior / siguiente |
| `%` | Paréntesis/bracket correspondiente |

### Saltos con Treesitter
| Comando | Descripción |
|---------|-------------|
| `]f` / `[f` | Función siguiente / anterior |
| `]k` / `[k` | Clase siguiente / anterior |
| `]d` / `[d` | Diagnóstico siguiente / anterior |
| `]q` / `[q` | Item siguiente / anterior del quickfix |
| `]b` / `[b` | Buffer siguiente / anterior |

### Saltos Rápidos
| Comando | Descripción |
|---------|-------------|
| `:[línea]` | Ir a línea específica (ej: `:42`) |
| `m[a-z]` | Marcar posición con letra |
| `'[a-z]` | Saltar a marca |
| `Ctrl+o` / `Ctrl+i` | Volver / avanzar en el jump list |

---

## ✏️ Edición

### Modos
| Comando | Descripción |
|---------|-------------|
| `i` / `a` | Insertar antes / después del cursor |
| `I` / `A` | Insertar al inicio / final de línea |
| `o` / `O` | Nueva línea abajo / arriba |
| `Esc` | Volver a modo normal |

### Eliminar, Cambiar y Copiar
| Comando | Descripción |
|---------|-------------|
| `x` | Eliminar carácter |
| `d[movimiento]` / `dd` / `D` | Eliminar / línea / hasta final de línea |
| `c[movimiento]` / `cc` / `C` | Cambiar / línea / hasta final de línea |
| `y[movimiento]` / `yy` | Copiar / línea |
| `p` / `P` | Pegar después / antes |
| `p` (en visual) | Pegar sin perder lo copiado |

### Otros
| Comando | Descripción |
|---------|-------------|
| `u` / `Ctrl+r` | Deshacer / rehacer (persistente entre sesiones) |
| `.` | Repetir último cambio |
| `J` | Unir línea con la siguiente |
| `>>` / `<<` / `=` | Indentar / desindentar / auto-indentar |
| `gcc` / `gc[movimiento]` | Comentar línea / movimiento |
| `]<Space>` / `[<Space>` | Línea vacía abajo / arriba |

---

## 🧩 Textobjects y Surround

Se combinan con `d`, `c`, `y`, `v`: `a` = incluye todo (around), `i` = solo el interior (inside).

### Textobjects (mini.ai + treesitter)
| Objeto | Descripción | Ejemplo |
|--------|-------------|---------|
| `f` | Función (treesitter) | `daf` borra la función, `vif` selecciona su cuerpo |
| `c` | Clase (treesitter) | `yac` copia la clase |
| `o` | Bloque, if o loop (treesitter) | `cio` cambia el contenido del if |
| `a` | Argumento | `dia` borra el argumento actual |
| `q` | Cualquier comilla | `ciq` cambia el texto entre comillas |
| `b` | Cualquier paréntesis/corchete/llave | `dab` borra con los paréntesis |
| `t` | Tag HTML/JSX | `cit` cambia el contenido del tag |
| `"`, `'`, `(`, `[`, `{` | El carácter indicado | `vi(` |

Modificadores: `n` = siguiente, `l` = anterior. Ejemplos: `canf` cambia la **siguiente** función, `dilq` borra dentro de las comillas **anteriores**.
También funcionan si el cursor no está dentro: `ci"` busca las comillas más cercanas en la línea.

### Surround (mini.surround)
| Comando | Descripción |
|---------|-------------|
| `sa[movimiento][car]` | Agregar: `saiw"` rodea la palabra con comillas |
| `sd[car]` | Borrar: `sd"` quita las comillas |
| `sr[viejo][nuevo]` | Reemplazar: `sr"'` cambia `"` por `'` |
| `sf` / `sF` | Buscar el surround a la derecha / izquierda |
| `sh` | Resaltar el surround |
| `sa` (en visual) | Rodear la selección |

Con `t` como carácter se trabaja con tags: `saiwt` pide el nombre del tag.

### Tags HTML/JSX (nvim-ts-autotag)
Al escribir `<div>` se cierra solo con `</div>`; al renombrar la etiqueta de apertura se renombra la de cierre.

---

## 🔎 Búsqueda y Reemplazo

| Comando | Descripción |
|---------|-------------|
| `/patrón` / `?patrón` | Buscar adelante / atrás |
| `n` / `N` | Resultado siguiente / anterior |
| `*` / `#` | Buscar palabra bajo el cursor adelante / atrás |
| `:%s/viejo/nuevo/g` | Reemplazar en todo el archivo |
| `:%s/viejo/nuevo/gc` | Reemplazar con confirmación |
| `:1,10s/viejo/nuevo/g` | Reemplazar en rango |

---

## ⚡ Buscar Archivos y Texto (fff)

### Archivos
| Comando | Descripción |
|---------|-------------|
| `<Space><Space>` | Buscar archivos (con frecency) |
| `<leader>fr` | Archivos recientes |
| `<leader>fb` | Buffers abiertos |
| `<leader>fs` | Re-escanear archivos |

### Texto
| Comando | Descripción |
|---------|-------------|
| `<leader>sg` | Live grep |
| `<leader>sw` | Grep de la palabra bajo el cursor |

### Otros (`<leader>s`)
| Comando | Descripción |
|---------|-------------|
| `<leader>sh` | Buscar en la ayuda |
| `<leader>sm` | Man pages |
| `<leader>sd` | Diagnósticos (location list) |
| `<leader>sq` | Quickfix |
| `<leader>sR` | Registers |
| `<leader>sk` | Marks |
| `<leader>sj` | Jump list |

---

## 🪟 Ventanas

| Comando | Descripción |
|---------|-------------|
| `Ctrl+h/j/k/l` | Ir a la ventana izquierda / abajo / arriba / derecha |
| `qq` | Split horizontal |
| `sv` | Split vertical |
| `Ctrl+w` `q` | Cerrar ventana |
| `Ctrl+w` `o` | Cerrar las demás ventanas |
| `Ctrl+w` `=` | Igualar tamaños |
| `Ctrl+w` `+` / `-` / `>` / `<` | Ajustar alto / ancho |

---

## 📁 Explorador de Archivos

### nvim-tree
| Comando | Descripción |
|---------|-------------|
| `<leader>e` | Abrir / cerrar el explorador |
| `<CR>` / `o` | Abrir archivo o carpeta |
| `Ctrl+v` / `Ctrl+x` | Abrir en split vertical / horizontal |
| `a` | Crear archivo (termina en `/` para carpeta) |
| `d` | Eliminar |
| `r` | Renombrar |
| `x` / `c` / `p` | Cortar / copiar / pegar |
| `y` / `Y` / `gy` | Copiar nombre / ruta relativa / ruta absoluta |
| `H` | Mostrar / ocultar archivos ocultos |
| `R` | Refrescar |
| `Ctrl+t` | Subir al directorio padre |
| `?` | Ayuda con todos los atajos |
| `q` | Cerrar |

### Archivos
| Comando | Descripción |
|---------|-------------|
| `:w` / `:wq` / `:q!` | Guardar / guardar y salir / salir sin guardar |
| `:e archivo` | Abrir archivo |
| `gx` | Abrir URL o ruta bajo el cursor |

---

## 🌿 Git

### Gitsigns (cambios por línea)
| Comando | Descripción |
|---------|-------------|
| `<leader>gn` / `<leader>gp` | Hunk siguiente / anterior |
| `<leader>gs` / `<leader>gr` | Stage / reset del hunk (también en visual) |
| `<leader>gu` | Deshacer stage del hunk |
| `<leader>gS` / `<leader>gR` | Stage / reset del buffer completo |
| `<leader>ghp` / `<leader>ghl` | Preview del hunk / preview inline |
| `<leader>gb` / `<leader>gB` | Blame de la línea / blame completo |
| `<leader>gd` / `<leader>gD` | Diff del archivo / diff contra HEAD~ |
| `<leader>gtb` | Toggle blame de línea |
| `<leader>gtd` | Toggle líneas borradas |
| `<leader>gts` / `<leader>gtn` | Toggle signos / resaltado de números |

### Diffview
| Comando | Descripción |
|---------|-------------|
| `<leader>dvo` / `<leader>dvc` | Abrir / cerrar Diffview |
| `<leader>dvf` | Historial de archivos |
| `<leader>dvh` | Historial del buffer |
| `<leader>dvt` | Toggle panel de archivos |
| `<leader>dvr` | Refrescar |
| `<leader>gc` | Historial de commits |

---

## 🤖 LSP

Estos atajos están disponibles cuando hay un servidor LSP activo en el buffer.

### Servidores (instalados por Mason)
| Lenguaje | Servidor |
|----------|----------|
| Go | gopls (staticcheck, gofumpt, inlay hints) |
| TypeScript / JavaScript | vtsls |
| ESLint / Tailwind / Emmet | eslint, tailwindcss, emmet_ls |
| CSS / JSON | cssls, jsonls (con esquemas de SchemaStore) |
| Prisma | prismals |
| Python / Rust / Lua | basedpyright, rust_analyzer, lua_ls |
| Docker | dockerls, docker_compose_language_service |

### Rápidos
| Comando | Descripción |
|---------|-------------|
| `K` | Documentación (hover) |
| `gd` | Ir a definición |
| `gr` | Referencias |
| `Ctrl+s` (insert) | Ayuda de firma (parámetros) |
| `grn` / `gra` / `gri` / `grt` | Rename / code action / implementación / tipo (nativos de Neovim) |
| `gO` | Símbolos del documento |

### Grupo `<leader>c`
| Comando | Descripción |
|---------|-------------|
| `<leader>cnd` / `<leader>cnD` | Definición / declaración |
| `<leader>cni` / `<leader>cnr` | Implementación / referencias |
| `<leader>caa` | Code actions |
| `<leader>caf` | Formatear documento (LSP) |
| `<leader>crr` | Renombrar símbolo |
| `<leader>chh` / `<leader>chs` | Hover / ayuda de firma |
| `<leader>cdd` | Diagnóstico de la línea |
| `<leader>cdn` / `<leader>cdp` | Diagnóstico siguiente / anterior |
| `<leader>cdq` | Diagnósticos a location list |
| `<leader>css` / `<leader>csw` | Símbolos del documento / workspace |

### Comandos
| Comando | Descripción |
|---------|-------------|
| `:LspInfo` | Estado de los servidores (`:checkhealth vim.lsp`) |
| `:Mason` | Instalar / actualizar servidores |

---

## 🐛 Diagnósticos

### Trouble (`<leader>x`)
| Comando | Descripción |
|---------|-------------|
| `<leader>xx` | Diagnósticos del proyecto |
| `<leader>xb` | Diagnósticos del buffer |
| `<leader>xs` | Símbolos |
| `<leader>xr` | Definiciones y referencias (LSP) |
| `<leader>xq` | Quickfix |
| `<leader>xl` | Location list |

### Nativos
| Comando | Descripción |
|---------|-------------|
| `]d` / `[d` | Diagnóstico siguiente / anterior |
| `]D` / `[D` | Último / primer diagnóstico |
| `Ctrl+w` `d` | Ver diagnóstico bajo el cursor |

### Linters
En Go, **golangci-lint** (vía nvim-lint) corre al abrir, guardar y salir de modo insert. Sus avisos aparecen junto a los del LSP.

---

## 🐞 Depuración (DAP)

nvim-dap + nvim-dap-ui. En Go usa **delve** (instalado por Mason). La UI se abre sola al empezar y se cierra al terminar.

| Comando | Descripción |
|---------|-------------|
| `<leader>db` | Poner / quitar breakpoint |
| `<leader>dB` | Breakpoint con condición |
| `<leader>dc` | Iniciar / continuar (elige configuración) |
| `<leader>dn` | Paso: siguiente línea (step over) |
| `<leader>di` | Paso: entrar en la función (step into) |
| `<leader>do` | Paso: salir de la función (step out) |
| `<leader>de` | Evaluar expresión bajo el cursor / selección |
| `<leader>dr` | Abrir / cerrar REPL |
| `<leader>dl` | Repetir la última sesión |
| `<leader>du` | Abrir / cerrar la UI |
| `<leader>dq` | Terminar |
| `<leader>dt` | Depurar el test de Go bajo el cursor |

Signos: `●` breakpoint, `◆` condicional, `▶` línea actual.

---

## 🧪 Tests (neotest)

Para Go usa neotest-golang con **gotestsum** (instalado por Mason). Los resultados aparecen en la columna de signos.

| Comando | Descripción |
|---------|-------------|
| `<leader>tt` | Correr el test más cercano |
| `<leader>tf` | Correr los tests del archivo |
| `<leader>ta` | Correr todos los tests del proyecto |
| `<leader>tl` | Repetir el último |
| `<leader>td` | Depurar el test más cercano |
| `<leader>tS` | Detener |
| `<leader>ts` | Resumen (árbol de tests) |
| `<leader>to` | Ver el output del test |
| `<leader>tO` | Panel de output |

---

## 💡 Autocompletado e IA

### blink.cmp
| Comando | Descripción |
|---------|-------------|
| `Tab` / `Shift+Tab` | Siguiente / anterior sugerencia |
| `↓` / `↑` | Siguiente / anterior sugerencia |
| `Enter` | Aceptar (agrega paréntesis en funciones) |

Fuentes: LSP, rutas, snippets del LSP, buffer y, en archivos Lua, la API de Neovim (lazydev).

### Colores
Los colores hex/rgb/hsl y las clases de Tailwind (`bg-red-500`) muestran un cuadro `■` con el color al lado.

### Supermaven (IA)
| Comando | Descripción |
|---------|-------------|
| `Ctrl+l` | Aceptar sugerencia completa |
| `Ctrl+j` | Aceptar una palabra |
| `Ctrl+]` | Descartar sugerencia |

---

## 🧹 Formato

Se formatea automáticamente al guardar con conform.nvim.

| Lenguaje | Formateador |
|----------|-------------|
| Lua | stylua |
| JS / TS / JSON / CSS | biome si el proyecto tiene `biome.json`, si no prettier |
| Go | goimports (agrega/ordena imports) + gofumpt |
| Python | isort + black |
| HTML / Markdown | prettier |
| Rust | rustfmt |
| Prisma | LSP (`prisma format`) |
| Dockerfile y resto | LSP (si lo soporta) |

biome y prettier usan la versión y la config del proyecto (`node_modules`) si existen.

| Comando | Descripción |
|---------|-------------|
| `<leader>cf` | Formatear archivo o selección |
| `:ConformInfo` | Ver qué formateadores aplican y si están instalados |

---

## 📊 Dashboard

Al abrir Neovim sin archivos:

| Tecla | Descripción |
|-------|-------------|
| `n` | Nuevo archivo |
| `f` | Buscar archivos |
| `r` | Archivos recientes |
| `g` | Live grep |
| `b` | Buffers |
| `h` | Buscar en la ayuda |
| `c` | Archivos de la config |
| `l` | Estado del LSP |
| `m` | Actualizar plugins (`vim.pack.update()`) |
| `t` | Restaurar sesión (`~/.config/nvim/session.vim`) |
| `q` | Salir |

---

## 📋 Clipboard (macOS)

El clipboard de macOS está sincronizado con Neovim (`clipboard=unnamedplus`).

| Acción | Resultado |
|--------|-----------|
| `y` en Neovim | Disponible con `Cmd+V` en otras apps |
| `Cmd+C` en otra app | Disponible con `p` en Neovim |

| Register | Contenido |
|----------|-----------|
| `:registers` | Ver todos |
| `"0` | Último yank |
| `"-` | Último borrado pequeño |
| `"+` / `"*` | Clipboard del sistema |

---

## 📦 Plugins

Los plugins se gestionan con `vim.pack` (nativo de Neovim 0.12) en `init.lua`.

| Comando | Descripción |
|---------|-------------|
| `:lua vim.pack.update()` | Actualizar plugins |
| `:lua vim.pack.del({ "nombre" })` | Quitar un plugin |
| `:TSUpdate` | Actualizar parsers de treesitter |

> Después de instalar o actualizar, guarda el lockfile en el repo:
> `chezmoi re-add ~/.config/nvim/nvim-pack-lock.json`

---

## 🎓 Workflow Típico

```
nvim                      # Abre el dashboard
<Space><Space>            # Buscar un archivo
<leader>sg                # Buscar texto en el proyecto
K / gd                    # Ver docs / ir a definición
cif                       # Reescribir el cuerpo de una función
saiw"                     # Rodear una palabra con comillas
:w                        # Guardar (se formatea solo)
<leader>xx                # Revisar errores del proyecto
<leader>gs                # Stage del cambio
<leader>dvo               # Revisar el diff antes del commit
```

---

## ⚡ Top 20

| # | Comando | Función |
|---|---------|---------|
| 1 | `<Space><Space>` | Buscar archivos |
| 2 | `<leader>sg` | Buscar texto |
| 3 | `<leader>e` | Explorador |
| 4 | `<leader>fr` | Archivos recientes |
| 5 | `<leader>fb` | Buffers |
| 6 | `K` | Documentación |
| 7 | `gd` | Ir a definición |
| 8 | `<leader>caa` | Code actions |
| 9 | `<leader>crr` | Renombrar |
| 10 | `<leader>cf` | Formatear |
| 11 | `<leader>xx` | Diagnósticos |
| 12 | `]d` / `[d` | Navegar diagnósticos |
| 13 | `daf` / `cif` | Borrar / cambiar función |
| 14 | `]f` / `[f` | Navegar funciones |
| 15 | `saiw"` / `sd"` | Agregar / quitar comillas |
| 16 | `gcc` | Comentar línea |
| 17 | `<leader>gs` | Stage del hunk |
| 18 | `<leader>gb` | Git blame |
| 19 | `<leader>dvo` | Diffview |
| 20 | `<leader>tt` / `<leader>db` | Correr test / breakpoint |

---

**¡Disfruta usando Neovim! 🚀**

> Última actualización: 2026-10-15
> Versión: Neovim 0.12.6
