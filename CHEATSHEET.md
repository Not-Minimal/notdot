# 🎯 Neovim Cheat Sheet - Guía Completa

## 📋 Índice
- [Navegación](#navegación)
- [Edición](#edición)
- [Búsqueda y Reemplazo](#búsqueda-y-reemplazo)
- [Ventanas](#ventanas)
- [Archivos y Explorador](#archivos-y-explorador)
- [Git](#git)
- [LSP (Language Server)](#lsp-language-server)
- [Snippets](#snippets)
- [Telescope](#telescope)
- [Terminal](#terminal)
- [Dashboard](#dashboard)
- [Clipboard](#clipboard)
- [Tema](#tema)

---

## 🔍 Navegación

### Movimiento Básico
| Comando | Descripción |
|---------|-------------|
| `h`, `j`, `k`, `l` | Mover izquierda, abajo, arriba, derecha |
| `w` | Saltar a inicio de siguiente palabra |
| `b` | Saltar a inicio de palabra anterior |
| `e` | Saltar a final de palabra actual |
| `0` | Ir al inicio de línea |
| `$` | Ir al final de línea |
| `gg` | Ir al inicio del archivo |
| `G` | Ir al final del archivo |
| `Ctrl+f` | Avanzar una pantalla |
| `Ctrl+b` | Retroceder una pantalla |
| `Ctrl+d` | Avanzar media pantalla |
| `Ctrl+u` | Retroceder media pantalla |
| `{` | Saltar al párrafo anterior |
| `}` | Saltar al párrafo siguiente |
| `%` | Ir al paréntesis/bracket matching |

### Saltos Rápidos
| Comando | Descripción |
|---------|-------------|
| `:[línea]` | Ir a línea específica (ej: `:42`) |
| `Ctrl+g` | Mostrar posición actual |
| `m[a-z]` | Marcar posición con letra |
| `'[a-z]` | Saltar a marca |

---

## ✏️ Edición

### Modos
| Comando | Descripción |
|---------|-------------|
| `i` | Insertar antes del cursor |
| `I` | Insertar al inicio de línea |
| `a` | Insertar después del cursor |
| `A` | Insertar al final de línea |
| `o` | Nueva línea abajo e insertar |
| `O` | Nueva línea arriba e insertar |
| `Esc` o `jk` | Volver a modo normal |

### Eliminar y Copiar
| Comando | Descripción |
|---------|-------------|
| `x` | Eliminar carácter actual |
| `d[movimiento]` | Eliminar (ej: `dw` = palabra, `dd` = línea) |
| `dd` | Eliminar línea completa |
| `D` | Eliminar desde cursor al final de línea |
| `c[movimiento]` | Cambiar (borrar e insertar) |
| `cc` | Cambiar línea completa |
| `C` | Cambiar desde cursor al final de línea |
| `y[movimiento]` | Copiar/yank (ej: `yw` = palabra, `yy` = línea) |
| `yy` | Copiar línea completa |
| `p` | Pegar después del cursor |
| `P` | Pegar antes del cursor |

### Indentación
| Comando | Descripción |
|---------|-------------|
| `>` | Aumentar indentación |
| `<` | Disminuir indentación |
| `>>` | Indentación + para línea |
| `<<` | Indentación - para línea |
| `=` | Auto-indentar |

### Otros
| Comando | Descripción |
|---------|-------------|
| `~` | Toggle mayúsculas/minúsculas |
| `u` | Deshacer (undo) |
| `Ctrl+r` | Rehacer (redo) |
| `.` | Repetir último comando |
| `J` | Unir línea actual con siguiente |

---

## 🔎 Búsqueda y Reemplazo

### Búsqueda
| Comando | Descripción |
|---------|-------------|
| `/patrón` | Buscar hacia adelante |
| `?patrón` | Buscar hacia atrás |
| `n` | Siguiente resultado |
| `N` | Resultado anterior |
| `*` | Buscar palabra bajo cursor |
| `#` | Buscar palabra anterior bajo cursor |

### Reemplazo
| Comando | Descripción |
|---------|-------------|
| `:s/viejo/nuevo` | Reemplazar en línea actual |
| `:s/viejo/nuevo/g` | Reemplazar todas en línea |
| `:%s/viejo/nuevo/g` | Reemplazar en todo archivo |
| `:%s/viejo/nuevo/gc` | Reemplazar con confirmación |
| `:1,10s/viejo/nuevo/g` | Reemplazar en rango |

---

## 🪟 Ventanas

### Navegación entre Ventanas
| Comando | Descripción |
|---------|-------------|
| `Ctrl+h` | Ventana izquierda |
| `Ctrl+j` | Ventana abajo |
| `Ctrl+k` | Ventana arriba |
| `Ctrl+l` | Ventana derecha |
| `Ctrl+w` `w` | Siguiente ventana |
| `Ctrl+w` `p` | Ventana anterior |

### Crear y Cerrar Ventanas
| Comando | Descripción |
|---------|-------------|
| `qq` | Split horizontal (dividir arriba/abajo) |
| `sv` | Split vertical (dividir izq/der) |
| `Ctrl+w` `q` | Cerrar ventana actual |
| `Ctrl+w` `o` | Cerrar todas las demás ventanas |
| `Ctrl+w` `c` | Cerrar buffer actual |

### Ajustar Tamaño
| Comando | Descripción |
|---------|-------------|
| `Ctrl+w` `+` | Aumentar altura |
| `Ctrl+w` `-` | Disminuir altura |
| `Ctrl+w` `>` | Aumentar ancho |
| `Ctrl+w` `<` | Disminuir ancho |
| `Ctrl+w` `=` | Igualar tamaños |

---

## 📁 Archivos y Explorador

### Neo-tree (Explorador de Archivos)
| Comando | Descripción |
|---------|-------------|
| `<leader>e` | Abre/cierra Neo-tree |
| `Esc` | Cierra Neo-tree |
| `q` | Cierra Neo-tree |
| `<space>` | Toggle carpeta |
| `<cr>` / `o` | Abrir archivo |
| `t` | Abrir en nueva pestaña |
| `w` | Abrir en split |
| `d` | Eliminar archivo |
| `r` | Renombrar archivo |
| `y` | Copiar archivo |
| `x` | Cortar archivo |
| `p` | Pegar archivo |
| `c` | Crear archivo |
| `m` | Crear carpeta |

### Operaciones de Archivos
| Comando | Descripción |
|---------|-------------|
| `:w` | Guardar archivo |
| `:w!` | Guardar forzadamente |
| `:wq` | Guardar y salir |
| `:q` | Salir |
| `:q!` | Salir sin guardar |
| `:e archivo` | Abrir archivo |
| `:e.` | Abrir explorador |
| `:!mkdir dir` | Ejecutar comando shell |

---

## 🌿 Git

### Gitsigns (Cambios de Línea)
| Comando | Descripción |
|---------|-------------|
| `<leader>gn` | Siguiente hunk (cambio) |
| `<leader>gp` | Hunk anterior |
| `<leader>gs` | Stage hunk (guardar cambio) |
| `<leader>gu` | Deshacer stage hunk |
| `<leader>gr` | Reset hunk (descartar cambio) |
| `<leader>gb` | Git blame (quién hizo el cambio) |
| `<leader>gB` | Git blame completo |
| `<leader>gd` | Diff del hunk |
| `<leader>gD` | Diff HEAD~ |
| `<leader>ghp` | Preview hunk |
| `<leader>gtd` | Toggle deleted |
| `<leader>gtb` | Toggle line blame |
| `<leader>gts` | Toggle signs |

### Seleccionar Múltiples Líneas
| Comando | Descripción |
|---------|-------------|
| `v` | Modo visual (seleccionar) |
| `V` | Modo visual línea |
| `Ctrl+v` | Modo visual bloque |
| `<leader>gs` | Stage selección |
| `<leader>gr` | Reset selección |

### Stage Completo Buffer
| Comando | Descripción |
|---------|-------------|
| `<leader>gS` | Stage buffer completo |
| `<leader>gR` | Reset buffer completo |

### Diffview (Ver Cambios)
| Comando | Descripción |
|---------|-------------|
| `<leader>dvo` | Abrir Diffview |
| `<leader>dvf` | Ver file history |
| `<leader>dvh` | Ver buffer history |
| `<leader>dvc` | Cerrar Diffview |
| `<leader>dvt` | Toggle file panel |

### LazyGit (Interfaz Git Completa)
| Comando | Descripción |
|---------|-------------|
| `gg` | Abrir LazyGit |

> **Dentro de LazyGit:** Usa `?` para ver todos los keybindings disponibles

---

## 🤖 LSP (Language Server)

### Hover y Ayuda
| Comando | Descripción |
|---------|-------------|
| `K` | Mostrar documentación hover |
| `Ctrl+k` | Signature help (parámetros función) |

### Navegación
| Comando | Descripción |
|---------|-------------|
| `<leader>lnd` | Go to definition |
| `<leader>lnD` | Go to declaration |
| `<leader>lni` | Go to implementation |
| `<leader>lnr` | Find references |
| `<leader>lnt` | Go to type definition |

### Refactoring
| Comando | Descripción |
|---------|-------------|
| `<leader>lrn` | Rename símbolo |
| `<leader>lra` | Code actions |
| `<leader>lrf` | Format buffer |
| `<leader>lio` | Organize imports |
| `<leader>lim` | Add missing imports |

### Símbolos
| Comando | Descripción |
|---------|-------------|
| `<leader>lsd` | Document symbols |
| `<leader>lsw` | Workspace symbols |

### Llamadas (Calls)
| Comando | Descripción |
|---------|-------------|
| `<leader>lci` | Incoming calls |
| `<leader>lco` | Outgoing calls |

### Diagnósticos
| Comando | Descripción |
|---------|-------------|
| `<leader>ldo` | Open diagnostics |
| `<leader>ldp` | Previous diagnostic |
| `<leader>ldn` | Next diagnostic |
| `<leader>lda` | All diagnostics |
| `<leader>ldb` | Buffer diagnostics |

---

## 🧩 Snippets

### Insertar Snippets
| Comando | Descripción |
|---------|-------------|
| Escribe trigger + `Tab` | Expande snippet (ej: `rfc` + Tab) |

### Navegar dentro de Snippet
| Comando | Descripción |
|---------|-------------|
| `Ctrl+k` | Ir a siguiente placeholder |
| `Ctrl+j` | Ir a placeholder anterior |
| `Ctrl+l` | Siguiente choice |
| `Ctrl+h` | Choice anterior |

### Snippets Disponibles

#### TypeScript/JavaScript/React
| Trigger | Descripción |
|---------|-------------|
| `rfc` | React Functional Component |
| `use` | useState hook |
| `uef` | useEffect hook |
| `asf` | async function |
| `af` | arrow function |

#### Python
| Trigger | Descripción |
|---------|-------------|
| `def` | Function definition |
| `cls` | Class definition |
| `for` | For loop |
| `if` | If statement |
| `try` | Try except block |

#### Lua
| Trigger | Descripción |
|---------|-------------|
| `fn` | Function |
| `lfn` | Local function |
| `tbl` | Table |

---

## 🔍 Telescope (Búsqueda Avanzada)

### Archivos
| Comando | Descripción |
|---------|-------------|
| `<leader>ff` | Find files |
| `<leader>fF` | Find all files (incluye hidden) |
| `<leader>fr` | Recent files (frecency) |
| `<leader>fb` | Buffers abiertos |

### Búsqueda de Texto
| Comando | Descripción |
|---------|-------------|
| `<leader>fg` | Live grep (buscar en archivos) |
| `<leader>fG` | Live grep (incluye hidden) |
| `<leader>fw` | Grep palabra bajo cursor |

### Git
| Comando | Descripción |
|---------|-------------|
| `<leader>fgc` | Git commits |
| `<leader>fgb` | Git branches |
| `<leader>fgs` | Git status |

### LSP
| Comando | Descripción |
|---------|-------------|
| `<leader>fld` | LSP definitions |
| `<leader>fli` | LSP implementations |
| `<leader>flr` | LSP references |
| `<leader>fls` | LSP document symbols |
| `<leader>flw` | LSP workspace symbols |

### Otros
| Comando | Descripción |
|---------|-------------|
| `<leader>fh` | Help tags |
| `<leader>fq` | Quickfix |
| `<leader>fde` | Diagnostics |
| `<leader>fm` | Man pages |
| `<leader>freg` | Registers |
| `<leader>fmk` | Marks |
| `<leader>fjl` | Jump list |

### Dentro de Telescope
| Comando | Descripción |
|---------|-------------|
| `Esc` / `Ctrl+c` | Cerrar |
| `Ctrl+j` | Siguiente item |
| `Ctrl+k` | Item anterior |
| `<cr>` | Seleccionar item |
| `Tab` | Multi-select |

---

## 💻 Terminal

### Toggle Terminal
| Comando | Descripción |
|---------|-------------|
| `Ctrl+\` | Toggle floating terminal |
| `<leader>t` | Toggle terminal |
| `<leader>T` | Cerrar terminal completamente |

### Dentro de la Terminal
| Comando | Descripción |
|---------|-------------|
| `Esc` / `jk` | Salir a modo normal |
| `Ctrl+h/j/k/l` | Navegar entre ventanas |

---

## 📊 Dashboard

Al abrir Neovim sin archivos, verás el dashboard con estos shortcuts:

| Tecla | Descripción |
|-------|-------------|
| `n` | New File |
| `f` | Find File |
| `r` | Recent Files |
| `g` | Live Grep |
| `b` | Buffers |
| `h` | Help Tags |
| `c` | Config |
| `l` | LSP Info |
| `m` | Lazy Manager |
| `t` | Restore Session |
| `q` | Quit |

---

## 📋 Clipboard (macOS)

### Sincronización Automática
Tu clipboard de macOS está completamente sincronizado con Neovim.

| Acción | Resultado |
|--------|-----------|
| Yank en Nvim (`y`) | Disponible en macOS apps (Cmd+V) |
| Copy en macOS (Cmd+C) | Disponible en Nvim (p) |

### Ejemplo
1. **Neovim → macOS:**
   - En Neovim: Selecciona texto → `y` (yank)
   - En Safari: Cmd+V → Pega el contenido ✅

2. **macOS → Neovim:**
   - En Safari: Cmd+C (copy)
   - En Neovim: Posiciona cursor → `p` (paste) ✅

### Registers
| Comando | Descripción |
|---------|-------------|
| `"` | Ver registers |
| `"0` | Último yank |
| `"-` | Último delete |
| `"+` | System clipboard |
| `"*` | System clipboard |

---

## 🎨 Tema

### Toggle Tema
| Comando | Descripción |
|---------|-------------|
| `<leader>tt` | Toggle tema (manual) |

> **Nota:** El tema se establece a tundra por defecto. El toggle se puede implementar en futuras versiones.

---

## 📱 Atajos Especiales

### Leader Key
El leader key es `<space>` (barra espaciadora)

Ejemplos:
- `<space>e` = Space + e = `<leader>e` (abrir neo-tree)
- `<space>ff` = Space + f + f = `<leader>ff` (find files)

### Combinaciones Útiles
| Comando | Qué Hace |
|---------|----------|
| `<space><space>` | Find files (shortcut rápido) |
| `<space>e` | Toggle explorador archivos |
| `<space>t` / `<space>T` | Toggle/cerrar terminal |
| `gg` | Abrir LazyGit |

---

## 🎓 Workflow Típico

### 1. Empezar a Codificar
```
nvim                          # Abre Neovim
n                             # New file (desde dashboard)
<esc>                         # O escribe nombre archivo
:w archivo.ts                 # Guardar
```

### 2. Navegar y Editar
```
<leader>ff                    # Find files
<leader>e                     # Toggle explorador
h/j/k/l                       # Navegar
i                             # Insertar texto
<esc>                         # Volver a normal
```

### 3. Usar Snippets
```
rfc<Tab>                      # Expande React component
<Ctrl+k>                      # Siguiente placeholder
// Escribe nombre
<Ctrl+k>                      # Siguiente
// Escribe contenido
<Esc>                         # Listo
```

### 4. Usar LSP
```
K                             # Ver documentación
<leader>lnd                   # Ir a definición
<leader>lra                   # Code actions
<leader>lrf                   # Format
```

### 5. Git Workflow
```
<leader>gn                    # Ver cambios (hunks)
<leader>gs                    # Stage cambios
gg                            # Abrir LazyGit para commit
```

### 6. Buscar y Reemplazar
```
<leader>fg                    # Live grep
?patrón                       # Buscar
:%s/viejo/nuevo/gc            # Reemplazar con confirm
```

---

## 💡 Consejos Útiles

### Comandos Ex Útiles
```
:set number              # Mostrar números de línea
:set nonumber            # Ocultar números
:set relativenumber      # Números relativos (distancia)
:set wrap                # Envolver líneas largas
:set nowrap              # No envolver
:set expandtab           # Espacios en lugar de tabs
:set tabstop=2           # Ancho de tab
:set shiftwidth=4        # Ancho de indentación
```

### Búsqueda Inteligente
- `/\cpatrón` - Búsqueda sin importar mayúsculas
- `/patrón\c` - Mismo resultado
- `/patrón.*final` - Búsqueda con regex

### Selecciones Útiles
- `ggVG` - Seleccionar todo archivo
- `vib` - Seleccionar dentro de brackets
- `vi"` - Seleccionar dentro de comillas
- `vip` - Seleccionar párrafo

### Macro Recording
```
qa                       # Empezar grabar macro 'a'
... acciones ...
q                        # Terminar recording
@a                       # Ejecutar macro 'a'
@@                       # Repetir última macro
```

---

## 🚀 Próximos Pasos

1. **Practica Navegación:**
   - Usa h/j/k/l sin flechas
   - Aprende w/b/e para movimiento de palabras
   - Usa gg/G para saltos rápidos

2. **Domina Edición:**
   - Practica d/c/y con movimientos
   - Usa `.` para repetir acciones
   - Aprende operadores compuestos

3. **Explora LSP:**
   - Usa K para ver documentación
   - Navega con definiciones
   - Usa code actions

4. **Automatiza con Snippets:**
   - Crea custom snippets
   - Usa placeholders inteligentes
   - Ahorra tiempo escribiendo

5. **Domina Git:**
   - Aprende hunk staging
   - Usa diffview para reviews
   - Integra LazyGit para commits

---

## 📖 Recursos

- `:help` - Documentación de Vim/Neovim
- `:h keymaps` - Ayuda con keybindings
- `:h lsp` - Ayuda con LSP
- `:checkhealth` - Diagnóstico de salud
- `:version` - Información de Neovim

---

## ⚡ Quick Reference - Top 20 Commands

| # | Comando | Función |
|---|---------|---------|
| 1 | `<leader>ff` | Buscar archivos |
| 2 | `<leader>fg` | Buscar texto |
| 3 | `<leader>e` | Abrir explorador |
| 4 | `<leader>lnd` | Ir a definición |
| 5 | `<leader>lra` | Code actions |
| 6 | `<leader>lrf` | Format code |
| 7 | `<leader>gs` | Stage git hunk |
| 8 | `<leader>gb` | Git blame |
| 9 | `gg` | LazyGit |
| 10 | `K` | Hover docs |
| 11 | `Ctrl+h/j/k/l` | Navegar ventanas |
| 12 | `<leader>t` | Toggle terminal |
| 13 | `rfc<Tab>` | React component |
| 14 | `<leader>fr` | Recent files |
| 15 | `<leader>fb` | Buffers |
| 16 | `%` | Match bracket |
| 17 | `*` | Search word |
| 18 | `u` | Undo |
| 19 | `/patrón` | Search |
| 20 | `:w` | Save |

---

**¡Disfruta usando Neovim! 🚀**

> Última actualización: 2026-05-03
> Versión: Neovim 0.12.2
