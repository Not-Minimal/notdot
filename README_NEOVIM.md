
# 🎯 Neovim Configuration - Guía Completa

Bienvenido a tu Neovim completamente configurado y optimizado.

## 📚 Documentación

### Cheatsheets Disponibles

#### 1. **CHEATSHEET.md** - Guía Completa en Markdown
   - 643 líneas
   - Formato profesional y legible
   - Índice navegable
   - Tablas de referencia
   - 200+ comandos documentados
   
   📖 Ver: `cat CHEATSHEET.md | less`

#### 2. **CHEATSHEET_VISUAL.txt** - Guía Visual ASCII
   - 454 líneas
   - Diagramas y flujos visuales
   - Mapas de teclas
   - Ejemplos prácticos
   - Ejercicios de aprendizaje
   
   📖 Ver: `cat CHEATSHEET_VISUAL.txt | less`

---

## 🚀 Comenzar Rápido

### Abre Neovim
```bash
nvim
```

### Crea un archivo nuevo desde el Dashboard
Presiona: `n`

### Aprende lo básico (5 minutos)
```
i          Insertar texto
<Esc>      Volver a modo normal
:w         Guardar
:q         Salir
h/j/k/l    Movimiento
/patrón    Buscar
```

---

## 🎯 Top 20 Comandos Más Usados

| # | Comando | Función |
|---|---------|---------|
| 1 | `<space>ff` | Buscar archivos |
| 2 | `<space>fg` | Buscar texto |
| 3 | `<space>e` | Explorador archivos |
| 4 | `<space>lnd` | Ir a definición (LSP) |
| 5 | `<space>lra` | Code actions (LSP) |
| 6 | `<space>lrf` | Format código (LSP) |
| 7 | `<space>gs` | Stage git hunk |
| 8 | `<space>gb` | Git blame |
| 9 | `gg` | LazyGit |
| 10 | `K` | Ver documentación |
| 11 | `Ctrl+h/j/k/l` | Navegar ventanas |
| 12 | `<space>t` | Terminal flotante |
| 13 | `rfc<Tab>` | React component (snippet) |
| 14 | `<space>fr` | Recent files |
| 15 | `<space>fb` | Buffers |
| 16 | `%` | Match bracket |
| 17 | `*` | Search word |
| 18 | `u` | Undo |
| 19 | `/patrón` | Search |
| 20 | `:w` | Save |

---

## 📁 Estructura de Configuración

```
~/.config/nvim/
├── init.lua                    # Entrada principal
├── lua/config/
│   ├── lsp-config.lua          # Language Server Protocol
│   ├── neotree-config.lua      # File explorer
│   ├── dashboard-config.lua    # Dashboard inicial
│   ├── which-key-config.lua    # Keybindings organization
│   ├── autopairs-config.lua    # Auto-pairing brackets
│   ├── luasnip-config.lua      # Snippets engine
│   ├── gitsigns-config.lua     # Git line changes
│   ├── diffview-config.lua     # Git diff viewer
│   ├── telescope-config.lua    # Fuzzy finder
│   ├── theme-config.lua        # Theme setup
│   └── clipboard-config.lua    # macOS clipboard sync
└── nvim-pack-lock.json         # Plugin versions
```

---

## 🔌 Plugins Instalados

### Core
- **nvim-lspconfig** - Language Server Protocol
- **blink.cmp** - Autocomplete with LSP
- **LuaSnip** - Snippet engine
- **which-key.nvim** - Keybinding helper

### Navigation
- **neo-tree.nvim** - File explorer
- **telescope.nvim** - Fuzzy finder
- **telescope-frecency.nvim** - Frecency sorting
- **oil.nvim** - Directory editor

### Git
- **gitsigns.nvim** - Git line changes
- **diffview.nvim** - Git diff viewer
- **lazygit.nvim** - LazyGit integration

### UI
- **alpha-nvim** - Dashboard
- **lualine.nvim** - Status line
- **noice.nvim** - UI notifications
- **nvim-notify** - Notifications

### Terminal
- **toggleterm.nvim** - Floating terminal

### Formatting
- **conform.nvim** - Formatters

### Other
- **mason.nvim** - LSP manager
- **nvim-treesitter** - Syntax highlighting
- **nvim-autopairs** - Auto-pairing
- **nvim-web-devicons** - Icons
- **supermaven-nvim** - AI completion

---

## 📚 Secciones del Cheatsheet

### CHEATSHEET.md incluye:
- ✅ Navegación
- ✅ Edición
- ✅ Búsqueda y Reemplazo
- ✅ Ventanas y Splits
- ✅ Archivos y Explorador
- ✅ Git Integration (Gitsigns, Diffview)
- ✅ LSP (Language Server)
- ✅ Snippets
- ✅ Telescope
- ✅ Terminal
- ✅ Dashboard
- ✅ Clipboard
- ✅ Tema
- ✅ Workflow Típico
- ✅ Consejos Útiles
- ✅ Quick Reference

### CHEATSHEET_VISUAL.txt incluye:
- ✅ Mapas visuales de teclas
- ✅ Diagramas ASCII
- ✅ Flujos de trabajo
- ✅ Ejemplos prácticos
- ✅ Ejercicios de aprendizaje
- ✅ Pro tips
- ✅ Recursos externos

---

## 🎓 Plan de Aprendizaje

### Semana 1
- **Día 1:** Aprende movimiento (h/j/k/l, w/b, gg/G)
- **Día 2:** Edición básica (i, dd, yy, p)
- **Día 3:** Búsqueda y reemplazo (/, :s)
- **Día 4:** Ventanas (qq, sv, Ctrl+hjkl)
- **Día 5-7:** Repasa y practica

### Semana 2
- **Día 8:** Neo-tree y Telescope
- **Día 9:** Git integration
- **Día 10:** LSP features
- **Día 11:** Snippets
- **Día 12-14:** Domina combinaciones

### Semana 3+
- Personalización
- Macros
- Text objects
- Advanced workflows

---

## 🎯 Workflow Típico

```
1. Abre Neovim
   $ nvim

2. Busca archivo
   <space>ff

3. Edita código
   i (insertar)
   <Esc> (salir de insertar)

4. Usa LSP
   K (documentación)
   <space>lnd (ir a definición)
   <space>lra (code actions)

5. Git
   <space>gs (stage)
   gg (LazyGit)

6. Guarda
   :w

7. Salir
   :q
```

---

## 🔧 Customización

### Cambiar Leader Key
El leader key actual es `<space>` (barra espaciadora).
Para cambiarlo, edita `init.lua`:
```lua
vim.g.mapleader = " "  -- Cambia a tu preferencia
```

### Añadir Custom Snippets
Edita `lua/config/luasnip-config.lua` y añade:
```lua
s("trigger", fmt("expanded text", {
    placeholder = i(1, "default"),
}))
```

### Cambiar Colorscheme
Edita `lua/config/theme-config.lua`:
```lua
vim.cmd.colorscheme("tu-theme")
```

---

## 🆘 Troubleshooting

### Problema: Keybinding no funciona
**Solución:** 
- Verifica en `:map` que esté registrada
- Revisa que no esté conflictada
- Consulta el cheatsheet

### Problema: Plugin no carga
**Solución:**
- Ejecuta `:checkhealth`
- Verifica plugin en `init.lua`
- Reinicia Neovim

### Problema: LSP no funciona
**Solución:**
- `:LspInfo` para ver status
- Instala language server: `:Mason`
- Verifica `lua/config/lsp-config.lua`

### Problema: Clipboard no sincroniza
**Solución:**
- Verifica que `pbcopy`/`pbpaste` existan
- Reinicia Neovim
- Consulta `lua/config/clipboard-config.lua`

---

## 📖 Documentación Oficial

### Dentro de Neovim
```
:help                    # Documentación general
:help keymaps           # Keybindings
:help lsp               # Language Server Protocol
:help lua               # Lua scripting
:checkhealth            # Diagnóstico
```

### Online
- https://neovim.io/doc/user/
- https://vim.fandom.com/wiki/Vim_Tips_Wiki
- https://www.openvim.com/ (juego interactivo)

---

## 🎉 ¡Listo para Comenzar!

1. **Abre el cheatsheet:**
   ```bash
   cat CHEATSHEET.md | less
   ```

2. **O el visual:**
   ```bash
   cat CHEATSHEET_VISUAL.txt | less
   ```

3. **Comienza Neovim:**
   ```bash
   nvim
   ```

4. **Practica 30 minutos diarios**

5. **¡Conviértete en un Vim ninja!** 🥷

---

## 💬 Feedback & Help

Si tienes problemas o sugerencias:
- Revisa el cheatsheet primero
- Usa `:help` dentro de Neovim
- Consulta la documentación oficial

---

**Última actualización:** 2026-05-03
**Versión Neovim:** 0.12.2
**Status:** ✅ Totalmente configurado y listo

---

¡Disfruta tu nuevo editor super-poderoso! 🚀

