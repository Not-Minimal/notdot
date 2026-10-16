# Formatter Setup Guide

## Overview

Neovim usa [conform.nvim](https://github.com/stevearc/conform.nvim) para formatear al guardar (`:w`).
Los formateadores son programas externos: si no están instalados, conform no puede formatear y muestra una notificación.

## Formateadores

| Lenguaje | Formateador | Instalación |
|----------|-------------|-------------|
| Lua | stylua | Brewfile |
| JavaScript / TypeScript / JSX / TSX | biome | Brewfile |
| JSON / JSONC / CSS | biome | Brewfile |
| Python | isort + black | Brewfile |
| HTML / Markdown | prettier | Brewfile |
| Rust | rustfmt | Toolchain de Rust (mise) |
| Dockerfile y otros | LSP | Automático si el servidor lo soporta |
| Todos | trim_whitespace, trim_newlines | Incluidos en conform |

`sql` y `java` no se formatean al guardar.

## Instalación

### 1. Formateadores (Homebrew)
Están en la sección "Formateadores" del [`Brewfile`](./Brewfile):
```bash
brew bundle --file ~/.local/share/chezmoi/Brewfile
```
O solo estos:
```bash
brew install stylua biome black isort prettier
```

### 2. Rustfmt (solo si programas en Rust)
Viene con el toolchain de Rust, gestionado con `mise`:
```bash
mise use -g rust
```

### 3. Reinicia Neovim
La config busca la ruta de cada formateador al arrancar.

## Verificación

```bash
which stylua biome black isort prettier rustfmt
```

Dentro de Neovim, con el archivo abierto:
```vim
:ConformInfo
```
Muestra qué formateadores aplican al buffer y si están disponibles.

## Uso

| Acción | Atajo |
|--------|-------|
| Formatear al guardar | `:w` (automático) |
| Formatear archivo o selección | `<leader>cf` |
| Formatear con el LSP | `<leader>caf` |

## Troubleshooting

### No formatea al guardar
1. Abre el archivo y corre `:ConformInfo`: indica qué formateador falta.
2. Instálalo (ver arriba) y reinicia Neovim.
3. Si hay un error, conform lo muestra como notificación (`notify_on_error = true`).
   Los mensajes anteriores se ven con `:Noice` o `:messages`.

### Formatea, pero con otro estilo
Cada formateador lee su propio archivo de configuración del proyecto:
`stylua.toml` / `.stylua.toml`, `biome.json`, `pyproject.toml` (black/isort), `.prettierrc`, `rustfmt.toml`.

## Configuración

- Formateadores y format on save: `dot_config/nvim/lua/config/conform-config.lua`
- `format_on_save` usa un timeout de 5 segundos y, si no hay formateador para el lenguaje, usa el del LSP (`lsp_format = "fallback"`).
- Edita en el repo de chezmoi y aplica con `chezmoi apply`.
