# Docker Compose LSP Setup & Configuration

## Installation

Docker Compose LSP is already installed globally:
```bash
npm install -g @microsoft/compose-language-service
```

This installs the language server at:
```
/opt/homebrew/lib/node_modules/@microsoft/compose-language-service/bin/docker-compose-langserver
```

## Verification

The LSP should auto-start when you open docker-compose files:
```bash
nvim docker-compose.yml
# Should show: docker_compose_ls in lualine
```

## Configuration

The following files are configured:

### 1. **lsp-config.lua** - LSP Server Setup (lines 265-295)
Defines how to start the Docker Compose LSP server:
- Command: `docker-compose-langserver --stdio`
- Filetypes: `yaml.docker-compose`
- Root markers: `docker-compose.yml`, `docker-compose.yaml`

### 2. **init.lua** - Filetype Detection (lines 65-72)
Automatically detects docker-compose files:
- Pattern: `docker-compose*.yml`, `docker-compose*.yaml`
- Filetype: `yaml.docker-compose`

### 3. **conform-config.lua** - Formatting
Docker Compose files use LSP fallback for formatting (standard YAML formatting)

## Usage

### Open a docker-compose file
```bash
# Standard name
nvim docker-compose.yml

# With variants
nvim docker-compose.prod.yml
nvim docker-compose.dev.yaml
nvim docker-compose.local.yaml
```

### Check LSP Status
In Neovim, look at lualine (bottom status bar):
- Should show: `📄 docker_compose_ls` if connected
- Shows: `No Active Lsp` if not connected

### LSP Commands

Once connected, you can use:

| Command | Keybinding | Action |
|---------|-----------|--------|
| Hover | `K` | Show service documentation |
| Go to Definition | `gd` | Jump to service definition |
| Autocompletion | `<C-x><C-o>` | Complete service names/keys |
| Code Actions | `<leader>caa` | Show available actions |
| Rename | `<leader>crr` | Rename service |
| Format | `<leader>cf` | Format YAML |
| Format on save | `:w` | Auto-format when saving |
| Find references | `gr` | Show service usages |

## Supported Features

✅ **Service validation** - Validates service definitions against Docker Compose schema
✅ **Autocompletion** - Suggests services, volumes, networks, etc.
✅ **Hover documentation** - Shows help for each property
✅ **Diagnostics** - Reports configuration errors
✅ **Schema validation** - Checks compose file version compatibility
✅ **Code formatting** - Formats YAML structure

## Troubleshooting

### "No Active Lsp" appears in lualine

**Problem:** Docker Compose LSP is not connecting

**Solution 1:** Verify file is recognized as docker-compose
```vim
:set filetype?
" Should show: filetype=yaml.docker-compose
```

**Solution 2:** Manually start the LSP
```vim
:LspStart docker_compose_ls
```

**Solution 3:** Check if docker-compose-langserver is accessible
```bash
ls /opt/homebrew/lib/node_modules/@microsoft/compose-language-service/bin/docker-compose-langserver
# If not found, reinstall:
npm install -g @microsoft/compose-language-service
```

**Solution 4:** View LSP logs
```vim
:LspLog
```

### Autocompletion not working

**Problem:** Suggestions don't appear while typing

**Solutions:**
1. Verify LSP is active: check lualine for `docker_compose_ls`
2. Try triggering completion manually: `<C-x><C-o>` in insert mode
3. Check YAML syntax - LSP won't suggest if file is malformed
4. Try `:LspRestart docker_compose_ls`

### Formatting issues

**Problem:** `<leader>cf` doesn't format or format is wrong

**Solutions:**
1. Verify LSP is active
2. Check if file has valid YAML syntax
3. Docker Compose LSP formats as YAML - uses default YAML rules
4. Alternatively use: `<leader>cf` with conform

### Services not recognized

**Problem:** Service names show as errors even though they're valid

**Solutions:**
1. Verify docker-compose.yml version is supported (3.0+)
2. Check YAML indentation - must be 2 spaces
3. Ensure all required properties are present
4. Check Docker Compose documentation for schema validation

## File Patterns

These files will automatically enable Docker Compose LSP:

✅ `docker-compose.yml` (standard)
✅ `docker-compose.yaml` (alternative extension)
✅ `docker-compose.prod.yml`
✅ `docker-compose.dev.yml`
✅ `docker-compose.local.yaml`
❌ `compose.yml` (not detected - use `docker-compose.yml`)
❌ `services.yml` (use specific filename)

## Example: Using Docker Compose LSP

```yaml
version: '3.8'

services:
  web:  # ← Hover shows "Service definition"
    image: node:18  # ← Autocomplete: suggests common images
    ports:
      - "3000:3000"  # ← LSP validates port format
    environment:  # ← Hover: "Environment variables"
      NODE_ENV: production
    depends_on:
      - db  # ← Autocomplete: suggests other services

  db:  # ← Referenced by web service
    image: postgres:15
    environment:
      POSTGRES_PASSWORD: secret
```

When you hover over `image:`, you'll see documentation for the image property.
When you type a service name, autocompletion will suggest existing services.

## Related Files

- `nvim/lua/config/lsp-config.lua` - LSP configuration (lines 265-295)
- `nvim/init.lua` - Filetype detection (lines 65-72)
- `nvim/lua/config/conform-config.lua` - Format settings (line 67)

## Performance Tips

- Docker Compose LSP is lightweight and should start instantly
- If startup is slow, check for network issues (schema validation may require internet)
- Large docker-compose files (100+ services) may see slight delays in validation

## Integration with Other Tools

### With Hadolint (for Dockerfile in same project)
Docker Compose LSP and Hadolint work together:
- Docker Compose LSP validates the compose file
- Hadolint validates the Dockerfile (if present)

### With Other YAML LSP
If you have a generic YAML LSP (like `yaml-language-server`), Docker Compose LSP takes precedence for `docker-compose.yml` files due to filetype: `yaml.docker-compose`

## Notes

- Docker Compose LSP requires the file to be named `docker-compose.yml/yaml` for detection
- The LSP auto-starts when you open matching files
- Root directory is detected from `docker-compose.yml` or `docker-compose.yaml` files
- Version 3.0+ of Docker Compose is fully supported
- Supports docker-compose schemas for versions 3.0 through 3.9+
