# 🎨 notdot - Dotfiles (Neovim 0.12+)

<div align="center">

![Neovim](https://img.shields.io/badge/neovim-0.12+-green?logo=neovim&logoColor=white)
![Language](https://img.shields.io/badge/language-lua-blue?logo=lua)
![License](https://img.shields.io/badge/license-MIT-green)
![chezmoi](https://img.shields.io/badge/managed%20with-chezmoi-blue)

Dotfiles para macOS gestionados con [chezmoi](https://www.chezmoi.io/): Neovim con LSP nativo y `vim.pack`, fish, Ghostty, Starship y Zed.

**[Instalación](#-instalación)** • **[Características](#-características)** • **[Atajos](#️-atajos-principales)** • **[Plugins](#-plugins)** • **[Cheatsheet](./CHEATSHEET.md)**

</div>

## ✨ Características

- 🚀 **Sin gestor externo** - Plugins con `vim.pack` nativo de Neovim 0.12 y lockfile versionado
- ⚡ **Búsqueda ultrarrápida** - fff.nvim (archivos con frecency + live grep en Rust)
- 🎯 **LSP nativo** - `vim.lsp.config` + Mason (TypeScript, Python, Rust, Lua, Tailwind, ESLint, Emmet)
- 🌳 **Treesitter** - Resaltado, indentación y textobjects por función/clase/bloque
- ✂️ **Edición rápida** - mini.ai, mini.surround, autopairs y auto-cierre de tags HTML/JSX
- 🐛 **Diagnósticos claros** - trouble.nvim para errores, símbolos y referencias
- 🧹 **Formato al guardar** - conform.nvim (stylua, biome, black, isort, prettier)
- 📦 **Dashboard propio** - alpha-nvim con accesos rápidos
- ⌨️ **Atajos organizados** - Menú jerárquico con which-key
- 🎨 **Tema** - Ayu dark

## 📋 Requisitos

- **macOS** con [Homebrew](https://brew.sh/)
- **Neovim** >= 0.12
- **Git** y **chezmoi**
- **tree-sitter** CLI (para compilar parsers)
- Una **Nerd Font** para los iconos

Salvo chezmoi (que se instala en el paso 1), todo eso y los formateadores están en el [`Brewfile`](./Brewfile).

## ⚡ Instalación

```bash
# 1. Instalar chezmoi y aplicar los dotfiles
brew install chezmoi
chezmoi init --apply https://github.com/Not-Minimal/notdot.git

# 2. Instalar herramientas (Neovim, formateadores, CLI, apps)
brew bundle --file ~/.local/share/chezmoi/Brewfile

# 3. Abrir Neovim: vim.pack instala los plugins y los parsers de treesitter
nvim
```

### Flujo de trabajo con chezmoi

La fuente de verdad es `~/.local/share/chezmoi`. Edita ahí y aplica:

```bash
chezmoi cd                              # Ir al repo
nvim dot_config/nvim/init.lua           # Editar
chezmoi apply                           # Aplicar a ~/.config
```

> `vim.pack` escribe el lockfile en `~/.config/nvim`. Después de instalar o
> actualizar plugins, súbelo al repo con `chezmoi re-add ~/.config/nvim/nvim-pack-lock.json`.

## 🗂️ Estructura

```
dot_config/
├── nvim/
│   ├── init.lua                 # Opciones, plugins (vim.pack.add) y carga de configs
│   ├── nvim-pack-lock.json      # Versiones fijadas de los plugins
│   └── lua/config/              # Una config por plugin (fff, lsp, treesitter, mini, ...)
├── fish/                        # Shell
├── ghostty/                     # Terminal
├── zed/                         # Editor
└── starship.toml                # Prompt
Brewfile                         # Paquetes de Homebrew
```

## ⌨️ Atajos Principales

El leader es `<Space>`. Presiona `<Space>` y espera para ver el menú de which-key.

### Búsqueda (fff.nvim)
```
<Space><Space> → Buscar archivos
<leader>fr     → Archivos recientes
<leader>fb     → Buffers
<leader>sg     → Live grep
<leader>sw     → Grep de la palabra bajo el cursor
```

### LSP
```
K              → Documentación (hover)
gd             → Ir a definición
<leader>caa    → Code actions
<leader>crr    → Renombrar símbolo
<leader>cf     → Formatear archivo
```

### Diagnósticos (trouble.nvim)
```
<leader>xx     → Diagnósticos del proyecto
<leader>xb     → Diagnósticos del buffer
[d / ]d        → Diagnóstico anterior / siguiente
```

### Edición (mini.ai, mini.surround, treesitter)
```
daf / cif      → Borrar función / cambiar su contenido
vic / vao      → Seleccionar clase / bloque (if, loop)
]f / [f        → Función siguiente / anterior
saiw"          → Rodear palabra con comillas
sd" / sr"'     → Borrar / reemplazar comillas
```

Lista completa en el **[CHEATSHEET](./CHEATSHEET.md)**.

## 📦 Plugins

**Búsqueda y archivos**
- [fff.nvim](https://github.com/dmtrKovalenko/fff.nvim) - Buscador de archivos y grep (Rust)
- [nvim-tree.lua](https://github.com/nvim-tree/nvim-tree.lua) - Explorador de archivos
- [aerial.nvim](https://github.com/stevearc/aerial.nvim) - Outline de símbolos

**LSP y autocompletado**
- [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig), [mason.nvim](https://github.com/mason-org/mason.nvim), [mason-lspconfig](https://github.com/mason-org/mason-lspconfig.nvim), [astrolsp](https://github.com/AstroNvim/astrolsp)
- [blink.cmp](https://github.com/Saghen/blink.cmp) - Autocompletado
- [lazydev.nvim](https://github.com/folke/lazydev.nvim) - API de Neovim para lua_ls
- [supermaven-nvim](https://github.com/supermaven-inc/supermaven-nvim) - Sugerencias con IA
- [trouble.nvim](https://github.com/folke/trouble.nvim) - Listas de diagnósticos y referencias

**Treesitter y edición**
- [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) + [textobjects](https://github.com/nvim-treesitter/nvim-treesitter-textobjects) (rama `main`)
- [nvim-ts-autotag](https://github.com/windwp/nvim-ts-autotag) - Cierre de tags HTML/JSX
- [mini.nvim](https://github.com/nvim-mini/mini.nvim) - mini.ai y mini.surround
- [nvim-autopairs](https://github.com/windwp/nvim-autopairs) - Cierre de paréntesis
- [conform.nvim](https://github.com/stevearc/conform.nvim) - Formato al guardar

**Git**
- [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim) - Cambios por línea, stage y blame
- [diffview.nvim](https://github.com/sindrets/diffview.nvim) - Diffs e historial

**UI**
- [ayu-vim](https://github.com/ayu-theme/ayu-vim) - Tema
- [alpha-nvim](https://github.com/goolord/alpha-nvim) - Dashboard
- [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim) - Barra de estado
- [which-key.nvim](https://github.com/folke/which-key.nvim) - Menú de atajos
- [noice.nvim](https://github.com/folke/noice.nvim) + [nvim-notify](https://github.com/rcarriga/nvim-notify) - Cmdline y notificaciones
- [nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons) - Iconos

**Otros**
- [herdr-nvim](https://github.com/ChmaraX/herdr-nvim), [vim-wakatime](https://github.com/wakatime/vim-wakatime), [plenary.nvim](https://github.com/nvim-lua/plenary.nvim), [nui.nvim](https://github.com/MunifTanjim/nui.nvim)

## 🔧 Personalización

| Qué | Dónde |
|-----|-------|
| Agregar/quitar plugins | `vim.pack.add({...})` en `dot_config/nvim/init.lua` |
| Tema | `dot_config/nvim/lua/config/theme-config.lua` |
| Servidores LSP | `ensure_installed` en `lua/config/lsp-config.lua` o `:Mason` |
| Formateadores | `lua/config/conform-config.lua` (+ `Brewfile`) |
| Parsers de treesitter | `lua/config/treesitter-config.lua` |
| Grupos de which-key | `lua/config/which-key-config.lua` |

## 🆘 Solucionar Problemas

### `<Space><Space>` o el grep fallan ("Failed to load fff rust backend")
```vim
:lua require("fff.download").download_or_build_binary()
```
Luego reinicia Neovim.

### No formatea al guardar
```bash
brew bundle --file ~/.local/share/chezmoi/Brewfile   # instala los formateadores
```
```vim
:ConformInfo
```

### LSP no funciona
```vim
:checkhealth vim.lsp
:Mason
```

### Actualizar o quitar plugins
```vim
:lua vim.pack.update()               " Actualizar todos
:lua vim.pack.del({ "nombre" })      " Quitar uno del disco y del lockfile
```

## 📄 Licencia

MIT - Libre para usar y modificar.

## 🎓 Aprende Más

- [Neovim Docs](https://neovim.io/doc/user/)
- [`:h vim.pack`](https://neovim.io/doc/user/pack.html)
- [Lua en Neovim](https://neovim.io/doc/user/lua.html)
- [chezmoi](https://www.chezmoi.io/user-guide/command-overview/)

---

Hecho con ❤️ para programadores que aman Vim y Lua.
