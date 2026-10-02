# ==============================================================================
# Brewfile — Entorno de desarrollo profesional macOS (Apple Silicon)
# Repositorio: github.com/Not-Minimal/notdot
# Uso: brew bundle --file=Brewfile
# ==============================================================================

# ------------------------------------------------------------------------------
# Taps
# ------------------------------------------------------------------------------
tap "homebrew/bundle"
tap "homebrew/services"

# ------------------------------------------------------------------------------
# Terminal moderna, Shell y Navegación
# ------------------------------------------------------------------------------
brew "git"
brew "gh"
brew "git-delta"       # Pagers enriquecidos con sintaxis para diffs de Git
brew "starship"        # Prompt ultrarrápido escrito en Rust
brew "atuin"           # Historial SQLite indexado y cifrado
brew "zoxide"          # Navegación inteligente de directorios (cd inteligente)
brew "fzf"             # Fuzzy finder interactivo
brew "direnv"          # Carga automática de .env por directorio
brew "eza"             # Reemplazo moderno y mantenido de ls con soporte Git
brew "bat"             # Reemplazo de cat con resaltado de sintaxis
brew "ripgrep"         # Búsqueda de texto en archivos a alta velocidad
brew "fd"              # Búsqueda rápida de archivos (reemplazo de find)
brew "tree"
brew "btop"            # Monitor de recursos avanzado
brew "herdr"

# Plugins de Zsh (Solo los esenciales sin conflictos)
brew "zsh-autosuggestions"
brew "zsh-fast-syntax-highlighting" # Más rápido que syntax-highlighting estándar
brew "zsh-history-substring-search"

# ------------------------------------------------------------------------------
# Herramientas de Desarrollo y Calidad de Código (CLI)
# ------------------------------------------------------------------------------
brew "neovim"
brew "lazygit"
brew "lazydocker"
brew "tree-sitter-cli" # Parser CLI para Neovim / Tree-sitter
brew "luarocks"        # Gestor de paquetes Lua para Neovim
brew "cmake"
brew "hadolint"        # Linter de Dockerfiles
brew "shellcheck"      # Linter de scripts Bash/Zsh
brew "actionlint"      # Validador de GitHub Actions workflows
brew "entr"            # Ejecución automática al cambiar archivos

# ------------------------------------------------------------------------------
# Gestión Universal de Runtimes y Aislamiento (Reemplazo de nvm/pyenv/etc.)
# ------------------------------------------------------------------------------
brew "mise"            # Orquestador único de Node, Python, Go, Rust y pnpm
brew "pipx"            # Ejecución de utilidades Python en entornos aislados

# ------------------------------------------------------------------------------
# Redes, Infraestructura y Cloud
# ------------------------------------------------------------------------------
brew "nmap"
brew "wget"
brew "mole"

# ------------------------------------------------------------------------------
# Aplicaciones GUI / IDEs / Contenedores (Casks)
# ------------------------------------------------------------------------------
cask "ghostty"
cask "raycast"
cask "orbstack"             # Alternativa a Docker Desktop: 10x más rápida y ligera en Mac
# cask "docker-desktop"     # Descomenta solo si prefieres Docker Desktop oficial
cask "android-studio"
cask "flutter"
cask "zed"
cask "claude"
cask "claude-code"

# ------------------------------------------------------------------------------
# Navegadores, Comunicación y Productividad
# ------------------------------------------------------------------------------
cask "google-chrome"
cask "whatsapp"
cask "obsidian"
cask "tailscale-app"        # Cask oficial de Tailscale (gestiona daemon y GUI)

# ------------------------------------------------------------------------------
# Tipografías Nerd Fonts (Diseñadas para Ghostty, Starship y Neovim)
# ------------------------------------------------------------------------------
cask "font-adwaita-mono-nerd-font"
cask "font-fira-mono-nerd-font"
cask "font-iosevka-nerd-font"
cask "font-jetbrains-mono"
