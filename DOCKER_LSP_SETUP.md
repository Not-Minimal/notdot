# Docker LSP Setup & Troubleshooting

## Installation

Docker LSP is already installed globally:
```bash
npm install -g dockerfile-language-server-nodejs
# Which installs: docker-langserver
```

## Verification

Check that the server is installed:
```bash
which docker-langserver
# Should return: /opt/homebrew/bin/docker-langserver
```

## Configuration

The following files are configured:

### 1. **lsp-config.lua** - LSP Server Setup
Defines how to start the Docker LSP server:
- Command: `docker-langserver --stdio`
- Filetypes: `dockerfile`
- Root markers: `Dockerfile`, `.dockerignore`, `docker-compose.yml`

### 2. **init.lua** - Filetype Detection
Automatically detects files as `dockerfile` filetype:
- Pattern: `Dockerfile*`, `dockerfile*`
- Files without extension are detected as `dockerfile`

### 3. **conform-config.lua** - Formatting
- Format-on-save enabled (uses LSP fallback)
- Keybinding: `<leader>cf` to format

## Usage

### Open a Dockerfile
```bash
# Exact name required for auto-detection
nvim Dockerfile

# Or any dockerfile variant
nvim Dockerfile.prod
nvim dockerfile.local
```

### Check LSP Status
In Neovim, look at lualine (bottom status bar):
- Should show: `📄 dockerls` if connected
- Shows: `No Active Lsp` if not connected

### LSP Commands

Once connected, you can use:

| Command | Keybinding | Action |
|---------|-----------|--------|
| Hover | `K` | Show documentation |
| Go to Definition | `gd` | Jump to definition |
| Code Actions | `<leader>caa` | Show available actions |
| Rename | `<leader>crr` | Rename symbol |
| Format | `<leader>cf` | Format document |
| Format on save | `:w` | Auto-format when saving |

## Troubleshooting

### "No Active Lsp" appears in lualine

**Problem:** Docker LSP is not connecting

**Solution 1:** Verify file is recognized as Dockerfile
```vim
:set filetype?
" Should show: filetype=dockerfile
```

**Solution 2:** Manually start the LSP
```vim
:LspStart dockerls
```

**Solution 3:** Check if docker-langserver is in PATH
```bash
which docker-langserver
# If not found:
npm install -g dockerfile-language-server-nodejs
```

**Solution 4:** View LSP logs
```vim
:LspLog
```

### Hover/Autocomplete not working

**Problem:** LSP started but features don't work

**Solutions:**
1. Verify the file has valid Dockerfile syntax
2. Try `:LspRestart dockerls` to restart
3. Check the buffer filetype: `:set filetype?` (should be `dockerfile`)
4. Look at LSP logs: `:LspLog`

### Format not working

**Problem:** `<leader>cf` or `:w` doesn't format

**Solutions:**
1. Verify LSP is active: check lualine for `dockerls`
2. Try manual format: `:lua require('conform').format()`
3. Check conform config: `nvim/lua/config/conform-config.lua`
4. Dockerfile LSP doesn't have a dedicated formatter - uses LSP fallback

## File Extensions

These files will automatically enable Dockerfile LSP:

✅ `Dockerfile` (no extension)
✅ `Dockerfile.prod`
✅ `Dockerfile.dev`
✅ `dockerfile`
✅ `dockerfile.local`
❌ `docker-compose.yml` (different, for docker-compose-language-service)

## Related Files

- `nvim/lua/config/lsp-config.lua` - LSP configuration (lines 245-263)
- `nvim/init.lua` - Filetype detection (lines 56-62)
- `nvim/lua/config/conform-config.lua` - Format settings (line 67)

## Additional Tools

### Hadolint (Optional - Dockerfile Linter)

If you want stricter Dockerfile linting, install hadolint:

```bash
brew install hadolint
```

This can be configured as an additional diagnostic tool, but the LSP already provides basic validation.

## Notes

- Docker LSP provides: autocompletion, diagnostics, hover info, code actions
- Format-on-save uses LSP fallback (no specific formatter for Dockerfile)
- The LSP auto-starts when you open any `Dockerfile*` file
- Root directory is detected from `Dockerfile`, `.dockerignore`, or `docker-compose.yml`
