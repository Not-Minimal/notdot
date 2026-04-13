# 🎨 notdot - Neovim 0.12.1+ Dotfiles

<div align="center">

![Neovim](https://img.shields.io/badge/neovim-0.12.1+-green?logo=neovim&logoColor=white)
![Language](https://img.shields.io/badge/language-lua-blue?logo=lua)
![License](https://img.shields.io/badge/license-MIT-green)
![Contributions](https://img.shields.io/badge/contributions-welcome-brightgreen)

Configuración moderna, minimalista y rápida de Neovim 0.12.1+ con LSP nativo para programadores.

**[Instalación Rápida](#-instalación-rápida)** • **[Características](#-características)** • **[Atajos](#️-atajos)** • **[Docs](./nvim/)** • **[Contribuir](./nvim/CONTRIBUTING.md)**

</div>

## ✨ Características

- 🚀 **Rápido** - Startup rápido con configuración optimizada
- 🎯 **LSP Completo** - Soporte para 10+ lenguajes (TypeScript, Python, Rust, Lua, etc.)
- 📦 **Dashboard Personalizado** - Inicio hermoso con snacks.nvim
- ⌨️ **Atajos Organizados** - Menú jerárquico con which-key
- 🔧 **Imports Inteligentes** - Organizar, agregar y quitar imports automáticamente
- 🗂️ **Símbolos de Código** - Visualizar structure del proyecto con pickers
- 🐛 **Diagnósticos Mejorados** - Navegación clara de errores
- 🎨 **Tema Moderno** - Tundra oscuro y minimalista
- 📂 **Explorador Avanzado** - neo-tree + oil + mini.files
- 💻 **Terminal Integrada** - toggleterm flotante

## 📋 Requisitos

- **Neovim** >= 0.12.1
- **Git**
- **ripgrep** - Búsquedas rápidas
- **fd** - Encontrar archivos
- (Opcional) **Nerd Font** para mejor visualización de iconos

## ⚡ Instalación Rápida

```bash
# Clonar
git clone https://github.com/Not-Minimal/notdot.git ~/.config/dotfiles

# Enlace simbólico
ln -s ~/.config/dotfiles/nvim ~/.config/nvim

# Abrir Neovim
nvim
```

✨ Todos los plugins están pre-configurados.

Para guía completa, ver [INSTALL.md](./nvim/INSTALL.md).

- **[README.md](./nvim/README.md)** - Guía completa, atajos, configuración
- **[INSTALL.md](./nvim/INSTALL.md)** - Instalación paso a paso
- **[CONTRIBUTING.md](./nvim/CONTRIBUTING.md)** - Cómo contribuir
- **[example-config.lua](./nvim/example-config.lua)** - Ejemplos de personalización

## ⌨️ Atajos Principales

### Navegación Rápida
```
K              → Hover info
gd             → Ir a definición
<C-k>          → Signature help
```

### Búsqueda
```
<Space><Space> → Buscar archivos
<leader>s      → Menú de búsqueda
<leader>sg     → Grep en código
```

### LSP - Organizado en menús
```
<leader>l      → Abre menú LSP
  n            → Navigate (definición, references, etc)
  r            → Refactor (rename, format, code actions)
  i            → Imports (organizar, agregar, quitar)
  s            → Symbols (símbolos del código)
  d            → Diagnostics (errores, warnings)
```

Ver [README.md](./nvim/README.md) para lista completa de atajos.

## 🎯 Características Principales

### Dashboard
```
:Snacks dashboard
```
Inicio personalizado con header ASCII art y atajos rápidos.

### LSP Avanzado
- Ir a definición/declaración/implementación
- Ver referencias y símbolos
- Organizar imports automáticamente
- Ver incoming/outgoing calls

### Imports Inteligentes
```
<leader>lio  → Organizar imports
<leader>liu  → Quitar no usados
<leader>lim  → Agregar faltantes
```

### Símbolos del Código
```
<leader>lsd  → Ver outline del documento
<leader>lsw  → Ver símbolos del workspace
```

### Diagnósticos
```
<leader>lda  → Ver todos los errores
<leader>ldb  → Errores del buffer actual
[d / ]d      → Navegar entre errores
```

## 🔧 Personalización

### Cambiar tema
```lua
vim.cmd.colorscheme "tundra"  -- Edit en init.lua
```

### Agregar LSP servers
```vim
:Mason
```

### Agregar atajos personalizados
Edita `~/.config/nvim/lua/config/which-key-config.lua`

Ver [example-config.lua](./nvim/example-config.lua) para más ejemplos.

## 📦 Plugins Incluidos

**UI & Tema**
- snacks.nvim - Dashboard y utilidades
- nvim-tundra - Tema minimalista
- lualine.nvim - Barra de estado
- nvim-web-devicons - Iconos

**LSP & Autocompletado**
- nvim-lspconfig - Configuración LSP nativa
- mason.nvim - Gestor de servidores
- blink.cmp - Autocompletado rápido

**Navegación**
- neo-tree.nvim - Explorador de archivos
- telescope.nvim - Fuzzy finder
- oil.nvim - Gestor de archivos estilo buffer
- mini.files - Mini gestor de archivos

**Edición**
- conform.nvim - Formatting
- tiny-inline-diagnostic.nvim - Diagnósticos en línea
- which-key.nvim - Menú de atajos
- toggleterm.nvim - Terminal flotante

**Git**
- diffview.nvim - Visor de diffs

Para lista completa, ver [README.md](./nvim/README.md#-plugins-instalados).

## 🆘 Solucionar Problemas

### No funciona copiar/pegar
```bash
# macOS
brew install reattach-to-user-namespace

# Linux
sudo apt install xclip
```

### LSP no funciona
```vim
:checkhealth
:Mason
```

### Los plugins no se descargan
```vim
:Lazy sync
```

Ver [INSTALL.md](./nvim/INSTALL.md#-solucionar-problemas) para más soluciones.

## 🤝 Contribuir

¡Pull requests bienvenidos! Especialmente para:

- Nuevos keybindings LSP
- Mejoras de rendimiento
- Mejor documentación
- Correcciones de bugs

Ver [CONTRIBUTING.md](./nvim/CONTRIBUTING.md) para detalles.

## 📄 Licencia

MIT - Libre para usar y modificar.

## 🎓 Aprende Más

- [Neovim Docs](https://neovim.io/doc/user/)
- [Lua en Neovim](https://neovim.io/doc/user/lua.html)
- [LSP](https://microsoft.github.io/language-server-protocol/)
- [Which-key.nvim](https://github.com/folke/which-key.nvim)
- [Snacks.nvim](https://github.com/folke/snacks.nvim)

## 💬 Preguntas?

- 📖 Lee [README.md](./nvim/README.md)
- 🔍 Busca en [Issues](https://github.com/Not-Minimal/notdot/issues)
- ❓ Abre un Issue o Discussion

---

Hecho con ❤️ para programadores que aman Vim y Lua.

⭐ Si te gusta, dale una estrella en GitHub!
