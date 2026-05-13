# Formatter Setup Guide

## Overview

Neovim with Conform is configured to auto-format your code on save. Here's what's needed:

## Installed Formatters

| Language | Formatter | Install Command | Status |
|----------|-----------|-----------------|--------|
| JavaScript/TypeScript | Biome | `npm install -g @biomejs/biome` | ✅ |
| Lua | Stylua | `brew install stylua` | ✅ |
| Python | Black + isort | `pipx install black isort` | ✅ |
| Rust | Rustfmt | `rustup component add rustfmt` | ✅ |
| HTML/Markdown | Prettier | `npm install -g prettier` | ✅ |
| JSON/CSS | Biome | `npm install -g @biomejs/biome` | ✅ |

## Full Installation Steps

### 1. Biome (for JavaScript/TypeScript)
```bash
npm install -g @biomejs/biome
```

### 2. Stylua (for Lua)
```bash
brew install stylua
```

### 3. Black + isort (for Python)
```bash
brew install pipx
pipx install black isort
pipx ensurepath
```

### 4. Prettier (for HTML/Markdown)
```bash
npm install -g prettier
```

### 5. Rustfmt (for Rust)
```bash
rustup component add rustfmt
```

## Verification

Test if formatters are installed:

```bash
which biome stylua black isort prettier rustfmt
```

All should return paths. If some are missing, run the installation commands above.

## Usage

### Auto-format on Save
Just save your file (`:w`) and it will auto-format!

### Manual Format
Press `<leader>cf` to format the current file or selection

### Keybindings

```
<leader>cf      Format document/selection
<leader>caf     Format document (LSP fallback)
<leader>caa     Code action (includes format)
```

## Troubleshooting

### Format not working?

1. **Check if formatter is installed**
   ```bash
   which <formatter-name>
   ```

2. **Check Neovim conform config**
   Open `nvim/lua/config/conform-config.lua` and verify formatters are defined

3. **Check Python formatters path**
   ```bash
   echo $HOME/.local/bin/black
   echo $HOME/.local/bin/isort
   ```

4. **Enable conform debugging**
   In Neovim: `:set loglevel=debug`

### Black/isort not found in PATH?

The formatters installed via pipx are in `~/.local/bin/`. The conform config automatically detects them there.

If they're still not found:
```bash
export PATH="$HOME/.local/bin:$PATH"
# Add this to your shell config (~/.zshrc or ~/.bashrc)
```

## Configuration Files

- Main config: `nvim/lua/config/conform-config.lua`
- LSP integration: `nvim/lua/config/lsp-config.lua`
- See both for keybindings and settings

## Notes

- Formatting happens **asynchronously** on save (default timeout: 5 seconds)
- If a specific formatter isn't available, it falls back to LSP formatter
- Trim whitespace is applied to all files
- Format errors are silently ignored to prevent write failures
