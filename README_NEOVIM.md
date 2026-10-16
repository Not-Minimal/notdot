# 🎯 Neovim Configuration - Guía Completa

Guía de la configuración de Neovim 0.12 de este repo: qué incluye, dónde está cada cosa y cómo aprenderla.

## 📚 Documentación

| Archivo | Contenido |
|---------|-----------|
| [README.md](./README.md) | Instalación con chezmoi, plugins y solución de problemas |
| [CHEATSHEET.md](./CHEATSHEET.md) | Todos los atajos en tablas, por sección |
| [CHEATSHEET_VISUAL.txt](./CHEATSHEET_VISUAL.txt) | Mapas de teclas y flujos en ASCII |
| [FORMATTER_SETUP.md](./FORMATTER_SETUP.md) | Formateadores por lenguaje |

📖 Desde la terminal: `less ~/.local/share/chezmoi/CHEATSHEET.md`

---

## 🚀 Comenzar Rápido

### Abre Neovim
```bash
nvim
```
Se abre el dashboard: `f` busca archivos, `r` abre recientes, `n` crea uno nuevo.

### Lo básico (5 minutos)
```
i          Insertar texto
<Esc>      Volver a modo normal
:w         Guardar (se formatea solo)
:q         Salir
h/j/k/l    Movimiento
/patrón    Buscar
<Space>    Espera un momento: which-key muestra todos los atajos
```

---

## 🎯 Top 20 Comandos Más Usados

| # | Comando | Función |
|---|---------|---------|
| 1 | `<Space><Space>` | Buscar archivos |
| 2 | `<Space>sg` | Buscar texto (live grep) |
| 3 | `<Space>e` | Explorador de archivos |
| 4 | `<Space>fr` | Archivos recientes |
| 5 | `<Space>fb` | Buffers |
| 6 | `K` | Ver documentación |
| 7 | `gd` | Ir a definición |
| 8 | `<Space>caa` | Code actions |
| 9 | `<Space>crr` | Renombrar símbolo |
| 10 | `<Space>cf` | Formatear |
| 11 | `<Space>xx` | Diagnósticos del proyecto |
| 12 | `]d` / `[d` | Siguiente / anterior error |
| 13 | `daf` / `cif` | Borrar función / cambiar su cuerpo |
| 14 | `]f` / `[f` | Siguiente / anterior función |
| 15 | `saiw"` / `sd"` | Agregar / quitar comillas |
| 16 | `gcc` | Comentar línea |
| 17 | `<Space>gs` | Stage git hunk |
| 18 | `<Space>gb` | Git blame |
| 19 | `<Space>dvo` | Diffview |
| 20 | `Ctrl+h/j/k/l` | Navegar ventanas |

---

## 📁 Estructura de Configuración

La fuente está en `~/.local/share/chezmoi/dot_config/nvim/` y chezmoi la copia a `~/.config/nvim/`.

```
dot_config/nvim/
├── init.lua                    # Opciones, keymaps base, vim.pack.add y carga de configs
├── nvim-pack-lock.json         # Versiones fijadas de los plugins
└── lua/config/
    ├── fff-config.lua          # Buscador de archivos/grep + pickers (buffers, recientes, ayuda)
    ├── lsp-config.lua          # Mason + servidores LSP + keymaps <leader>c
    ├── lazydev-config.lua      # API de Neovim para lua_ls
    ├── blink-config.lua        # Autocompletado
    ├── supermaven-config.lua   # Sugerencias con IA
    ├── conform-config.lua      # Formato al guardar
    ├── treesitter-config.lua   # Parsers, resaltado, indentación, ]f/[f
    ├── mini-config.lua         # mini.ai (textobjects) + mini.surround
    ├── trouble-config.lua      # Diagnósticos y listas <leader>x
    ├── autopairs-config.lua    # Cierre de paréntesis
    ├── nvim-tree-config.lua    # Explorador de archivos
    ├── aerial-config.lua       # Outline de símbolos
    ├── gitsigns-config.lua     # Cambios por línea, stage y blame
    ├── diffview-config.lua     # Diffs e historial
    ├── dashboard-config.lua    # Pantalla de inicio (alpha)
    ├── lualine-config.lua      # Barra de estado
    ├── which-key-config.lua    # Grupos de atajos
    ├── theme-config.lua        # Tema ayu
    └── clipboard-config.lua    # Clipboard de macOS
```

---

## 🔌 Plugins Instalados

Gestionados con `vim.pack` (nativo de Neovim 0.12), sin lazy.nvim.

### Búsqueda y archivos
- **fff.nvim** - Archivos con frecency y live grep (Rust)
- **nvim-tree.lua** - Explorador de archivos
- **aerial.nvim** - Outline de símbolos

### LSP y autocompletado
- **nvim-lspconfig**, **mason.nvim**, **mason-lspconfig.nvim**, **astrolsp** - LSP
- **blink.cmp** - Autocompletado
- **lazydev.nvim** - Autocompletado de la API de Neovim en Lua
- **supermaven-nvim** - Sugerencias con IA
- **trouble.nvim** - Diagnósticos, símbolos y referencias

### Treesitter y edición
- **nvim-treesitter** + **nvim-treesitter-textobjects** (rama `main`)
- **nvim-ts-autotag** - Cierre automático de tags HTML/JSX
- **mini.nvim** - mini.ai y mini.surround
- **nvim-autopairs** - Cierre de paréntesis
- **conform.nvim** - Formato al guardar

### Git
- **gitsigns.nvim** - Cambios por línea
- **diffview.nvim** - Diffs e historial

### UI
- **ayu-vim** - Tema
- **alpha-nvim** - Dashboard
- **lualine.nvim** - Barra de estado
- **which-key.nvim** - Menú de atajos
- **noice.nvim** + **nvim-notify** - Cmdline y notificaciones
- **nvim-web-devicons** - Iconos

### Otros
- **herdr-nvim**, **vim-wakatime**, **plenary.nvim**, **nui.nvim**

---

## 🎓 Plan de Aprendizaje

### Semana 1 - Vim básico
- **Día 1:** Movimiento (`h/j/k/l`, `w/b`, `gg/G`)
- **Día 2:** Edición (`i`, `dd`, `yy`, `p`, `.`)
- **Día 3:** Búsqueda y reemplazo (`/`, `:%s`)
- **Día 4:** Ventanas (`qq`, `sv`, `Ctrl+hjkl`)
- **Día 5-7:** Repasa y practica

### Semana 2 - Herramientas
- **Día 8:** fff (`<Space><Space>`, `<Space>sg`) y nvim-tree (`<Space>e`)
- **Día 9:** Git (gitsigns `<Space>g`, diffview `<Space>dv`)
- **Día 10:** LSP (`K`, `gd`, `<Space>c`) y trouble (`<Space>x`)
- **Día 11:** Textobjects (`daf`, `cia`, `ciq`) y surround (`sa`, `sd`, `sr`)
- **Día 12-14:** Combínalos

### Semana 3+
- Macros (`qa ... q`, `@a`)
- Saltos con treesitter (`]f`, `]k`)
- Personaliza tus propios atajos

---

## 🎯 Workflow Típico

```
1. Abre Neovim                    $ nvim
2. Busca un archivo               <Space><Space>
3. Busca texto en el proyecto     <Space>sg
4. Edita                          i ... <Esc>, cif, saiw"
5. Usa LSP                        K, gd, <Space>caa
6. Revisa errores                 <Space>xx
7. Guarda (se formatea solo)      :w
8. Git                            <Space>gs, <Space>dvo
9. Sal                            :q
```

---

## 🔧 Personalización

> Edita siempre en `~/.local/share/chezmoi/dot_config/nvim/` (con `chezmoi cd`) y aplica con `chezmoi apply`.
> Lo que edites directo en `~/.config/nvim` se pierde en el próximo `apply`.

### Cambiar Leader Key
En `init.lua`:
```lua
vim.g.mapleader = " "
```

### Agregar un plugin
En `init.lua`, dentro de `vim.pack.add({ ... })`:
```lua
{ src = "https://github.com/autor/plugin.nvim" },
```
Crea `lua/config/plugin-config.lua` con su `setup()` y agrégalo con `require("config.plugin-config")`.
Al abrir Neovim se instala; luego guarda el lockfile:
```bash
chezmoi re-add ~/.config/nvim/nvim-pack-lock.json
```

### Quitar un plugin
Bórralo de `vim.pack.add` y de su `require`, y luego:
```vim
:lua vim.pack.del({ "plugin.nvim" })
```

### Cambiar Colorscheme
En `lua/config/theme-config.lua`:
```lua
vim.cmd.colorscheme("tu-tema")
```

---

## 🆘 Troubleshooting

### Un atajo no funciona
- `:verbose map <tecla>` muestra quién la asignó
- Revisa conflictos en `:checkhealth which-key`
- Consulta el [CHEATSHEET](./CHEATSHEET.md)

### Un plugin no carga
- Verifica que esté en `vim.pack.add` en `init.lua`
- `:checkhealth vim.pack`
- Reinicia Neovim

### `<Space><Space>` o el grep fallan
```vim
:lua require("fff.download").download_or_build_binary()
```

### LSP no funciona
- `:LspInfo` para ver el estado
- Instala el servidor con `:Mason`
- Revisa `lua/config/lsp-config.lua`

### No formatea al guardar
- `:ConformInfo` muestra qué formateador falta
- Instálalos con `brew bundle --file ~/.local/share/chezmoi/Brewfile`

### Clipboard no sincroniza
- Verifica que existan `pbcopy`/`pbpaste`
- Revisa `lua/config/clipboard-config.lua`

---

## 📖 Documentación Oficial

### Dentro de Neovim
```
:help                    Documentación general
:help vim.pack           Gestor de plugins nativo
:help lsp                Language Server Protocol
:help treesitter         Treesitter
:help MiniAi             Textobjects de mini.ai
:help MiniSurround       Surround de mini.surround
:checkhealth             Diagnóstico
```

### Online
- https://neovim.io/doc/user/
- https://www.openvim.com/ (tutorial interactivo)

---

**Última actualización:** 2026-10-15
**Versión Neovim:** 0.12.6
