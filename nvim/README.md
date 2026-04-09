# 🚀 LazyVim Setup Completado

Tu configuración de Neovim está lista. Aquí está lo que se instaló:

## ✅ Instalación

- **Neovim**: `/opt/homebrew/bin/nvim` (v0.12.1)
- **Alias**: `nvim`, `vim`, `nv` → apuntan al binario de Homebrew
- **Dependencias**: ripgrep, fd, bat ya están instaladas

## 📦 Plugins Instalados

### UI & Tema
- `tokyonight.nvim` - Tema oscuro moderno
- `lualine.nvim` - Barra de estado
- `nvim-web-devicons` - Iconos

### Navegación
- `neo-tree.nvim` - Explorador de archivos
- `telescope.nvim` - Fuzzy finder

### LSP & Autocompletado
- `mason.nvim` - Gestor de LSP
- `nvim-lspconfig` - Configuración LSP
- `nvim-cmp` - Autocompletado con snippets

### Edición & Utilities
- `vim-surround` - Editar delimitadores
- `vim-commentary` - Comentarios
- `vim-fugitive` - Git integrado
- `gitsigns.nvim` - Indicadores Git en margen
- `nvim-autopairs` - Cierre automático
- `Comment.nvim` - Comentarios mejorados
- `todo-comments.nvim` - Highlight de TODOs
- `which-key.nvim` - Ayuda de keybindings
- `trouble.nvim` - Panel de diagnósticos

## 🎯 Atajos de Teclado Principales

### Navegación
```
Ctrl+h/j/k/l    → Mover entre splits
Alt+h/j/k/l     → Redimensionar ventanas
```

### Splits (Divisiones de ventana)
```
wv              → Split vertical (divide verticalmente)
wh              → Split horizontal (divide horizontalmente)
```

### Archivos
```
<leader>e       → Toggle explorador (Neo-tree)
<leader>ff      → Buscar archivo (Telescope)
<leader>fg      → Live grep - buscar en código
<leader>fb      → Buffers abiertos
<leader>fh      → Ayuda de tags
```

### LSP
```
<leader>ld      → Ir a definición
<leader>lD      → Ir a declaración
<leader>lh      → Hover - ver info
<leader>li      → Ir a implementación
<leader>ls      → Signature help
<leader>lr      → Renombrar símbolo
<leader>la      → Code actions
<leader>lf      → Formatear archivo
```

### Buffers & Vistas
```
<leader>bn      → Siguiente buffer
<leader>bp      → Buffer anterior
<leader>bc      → Cerrar buffer
<leader>nh      → Limpiar highlights
```

### Git
```
<leader>gs      → Git status
<leader>gc      → Git commit
<leader>gp      → Git push
```

### Diagnósticos
```
<leader>xx      → Toggle panel de errores
<leader>xw      → Diagnósticos del workspace
<leader>xd      → Diagnósticos del documento
<leader>xq      → Quickfix
<leader>xl      → Location list
```

### Búsqueda de TODOs
```
<leader>td      → Buscar TODO/FIXME/HACK/NOTE
```

## 🚀 Primeros Pasos

1. **Abre Neovim**:
   ```bash
   nvim
   ```
   o usa cualquiera de los alias: `vim`, `nv`

2. **Primera instalación de plugins**:
   Lazy.nvim instalará automáticamente todos los plugins en tu primera ejecución. Esto puede tardar 30-60 segundos.

3. **Instalar LSP servers**:
   Una vez en Neovim, ejecuta:
   ```vim
   :Mason
   ```
   Aquí puedes instalar/actualizar servidores de lenguaje (Python, TypeScript, etc.)

4. **Configuración personalizada**:
   - Archivo principal: `~/.config/nvim/lua/config/settings.lua`
   - Plugins: `~/.config/nvim/lua/plugins/`
   - Lazy config: `~/.config/nvim/lua/config/lazy.lua`

## 📁 Estructura de Carpetas

```
~/.config/nvim/
├── init.lua                 # Entry point
├── lua/
│   ├── config/
│   │   ├── lazy.lua        # Configuración de Lazy.nvim
│   │   └── settings.lua    # Configuración general de Vim
│   └── plugins/
│       ├── init.lua        # Importa todos los plugins
│       ├── theme.lua       # Tema y UI
│       ├── explorer.lua    # Neo-tree
│       ├── telescope.lua   # Búsqueda fuzzy
│       ├── lsp.lua         # LSP y autocompletado
│       └── editor.lua      # Edición y utilities
```

## 🔧 Actualizar Plugins

Dentro de Neovim, ejecuta:
```vim
:Lazy sync
```

## 📝 Notas

- Lazy.nvim descarga automáticamente plugins la primera vez
- Los LSP servers se descargan via Mason (`:Mason`)
- Treesitter parsers se instalan automáticamente (`:TSUpdate`)
- La mayoría de plugins están lazy-loaded para mejor rendimiento

## ⌨️ Quick Tips

- Presiona `?` en Telescope para ver opciones de búsqueda
- Presiona `<space>` en Neo-tree para expandir carpetas
- Usa `gc` (3 caracteres) para comentar líneas
- Los snippets de LuaSnip se activan con Tab
- Mantén presionado Ctrl mientras escribes para completado manual

---

¡Listo para codificar! 🎉
