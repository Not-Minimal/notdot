# ==============================================================================
# 1. RECONSTRUCCIÓN DE RUTAS DEL SISTEMA Y PATHS (Blindado)
# ==============================================================================
# Forzar las rutas por defecto de ZSH en macOS para evitar que fpath venga vacío
if (( ${#fpath} == 0 )); then
    fpath=(
        /usr/share/zsh/site-functions
        /usr/share/zsh/current/functions
        /usr/share/zsh/current/functions/Chpwd
        /usr/share/zsh/current/functions/Completion
        /usr/share/zsh/current/functions/Completion/Base
        /usr/share/zsh/current/functions/Exceptions
        /usr/share/zsh/current/functions/MIME
        /usr/share/zsh/current/functions/Misc
        /usr/share/zsh/current/functions/Prompts
        /usr/share/zsh/current/functions/VCS_Info
        /usr/share/zsh/current/functions/Zle
    )
fi

typeset -U path
export PATH="/opt/homebrew/bin:$PATH"
export PATH="/opt/homebrew/opt/postgresql@18/bin:$PATH"
export PATH="/Users/minimal/.local/bin:$PATH"

export ZSH_CUSTOM=/Users/minimal/Developments/Dotfiles/zsh
ulimit -Sn 4096

# Cargar funciones nativas esenciales del sistema antes que cualquier plugin
autoload -Uz add-zsh-hook is-at-least colors

# Inicialización de Starship (Prompt rápido en Rust)
eval "$(starship init zsh)"

# ==============================================================================
# 2. CONFIGURACIÓN DEL HISTORIAL Y COMPLETIONS
# ==============================================================================
HISTSIZE=50000
SAVEHIST=50000
HISTFILE=~/.zsh_history
setopt HIST_IGNORE_ALL_DUPS
setopt SHARE_HISTORY
setopt HIST_FIND_NO_DUPS

# Añadir tus completions personalizadas cuidando de no pisar lo nativo
fpath=($ZSH_CUSTOM/zsh-completions/src $fpath)

# Limpiar paths que no existan en el fpath actual
for p in $fpath; do [[ -d $p ]] || fpath=(${fpath:#$p}); done

# Cargar compinit ahora que el fpath tiene las rutas del sistema
autoload -Uz compinit
if [[ -n ~/.zcompdump(#qN.mh+24) ]]; then
    compinit -i
else
    compinit -C -i
fi

zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache

# ==============================================================================
# 3. PLUGINS (Orden estricto antibloqueos)
# ==============================================================================
[[ -f $ZSH_CUSTOM/zsh-vi-mode/zsh-vi-mode.plugin.zsh ]] && source $ZSH_CUSTOM/zsh-vi-mode/zsh-vi-mode.plugin.zsh
[[ -f $ZSH_CUSTOM/zsh-autopair/autopair.zsh ]] && source $ZSH_CUSTOM/zsh-autopair/autopair.zsh
[[ -f $ZSH_CUSTOM/zsh-you-should-use/you-should-use.plugin.zsh ]] && source $ZSH_CUSTOM/zsh-you-should-use/you-should-use.plugin.zsh
[[ -f $ZSH_CUSTOM/zsh-abbr/zsh-abbr.zsh ]] && source $ZSH_CUSTOM/zsh-abbr/zsh-abbr.zsh
[[ -f $ZSH_CUSTOM/zsh-autosuggestions/zsh-autosuggestions.zsh ]] && source $ZSH_CUSTOM/zsh-autosuggestions/zsh-autosuggestions.zsh
[[ -f $ZSH_CUSTOM/zsh-history-substring-search/zsh-history-substring-search.zsh ]] && source $ZSH_CUSTOM/zsh-history-substring-search/zsh-history-substring-search.zsh

# fast-syntax-highlighting DEBE ser el último absoluto en cargarse siempre
[[ -f $ZSH_CUSTOM/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh ]] && source $ZSH_CUSTOM/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh

# Configuración de Plugins & Binds
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
ZSH_AUTOSUGGEST_CLEAR_WIDGETS+=(abbr-expand-and-insert) # Evita el bucle infinito con zsh-abbr

bindkey '\e[1;3A' history-substring-search-up
bindkey '\e[1;3B' history-substring-search-down

# Fancy Ctrl+Z - Toggle entre fg y clear
fancy-ctrl-z () {
  if [[ $#BUFFER -eq 0 ]]; then BUFFER="fg"; zle accept-line; else zle push-input; zle clear-screen; fi
}
zle -N fancy-ctrl-z
bindkey '^Z' fancy-ctrl-z

# ==============================================================================
# 4. ALIASES Y COMANDOS PERSONALIZADOS
# ==============================================================================
# Navegación y Core
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias c="clear"
alias h="history"
alias e="exit"
alias mkdir="mkdir -p"
alias port="sudo lsof -i -P | grep"

# Herramientas CLI Modernas
alias ls="eza --icons --git"
alias ll="eza -lah --icons --git --group-directories-first"
alias la="lsd -la"
alias lt="eza --tree --level=2 --icons"
alias lta="eza --tree --level=3 --icons --git-ignore"
alias cat="bat"
alias f="fd"
alias rg="rg --smart-case --hidden"

# Editores y Entornos
alias v="nvim"
alias vim="nvim"
alias to="tmux attach -t"
alias tc="tmux new -s"
alias tls="tmux ls"
alias tconf='tmux source-file ~/.tmux.conf || echo "No tmux session activa"'
alias lzd="lazydocker"
alias lazygit='lazygit --use-config-file="/Users/minimal/Library/Application Support/lazygit/config.yml,/Users/minimal/Library/Application Support/lazygit/catppuccin-mocha-blue.yml"'

# Desarrollo (Git / Node / DB)
alias studio="npx prisma studio"
alias ni="npm install"
alias nid="npm install --save-dev"
alias nr="npm run"
alias dev="npm run dev"
alias build="npm run build"

alias gco="git checkout"
alias gb="git branch"
alias gl="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias grh="git reset --hard"
alias gst="git stash"
alias gstp="git stash pop"
alias ga="git add ."
alias gd="git diff"
alias gs="git status"
alias gc="git commit -m"
alias gp="git push"
alias gpo="git pull origin"
alias gps="git push --set-upstream origin"

# Globalias (Expansión global de comandos)
alias -g G='| grep'
alias -g L='| less'
alias -g J='| jq'
alias -g NE='2> /dev/null'
alias -g H='| head'
alias -g T='| tail'
alias jqp="jq -C | less -R"

# Directorios Frecuentes
alias projects="cd ~/Developments"
alias config="cd ~/.config/"
alias downloads="cd ~/Downloads"
alias desktop="cd ~/Desktop"
alias docs="cd ~/Documents"

# ==============================================================================
# 5. INTEGRACIÓN DE HERRAMIENTAS CLI (FZF, Atuin, Z.lua, NVM)
# ==============================================================================
# FZF Config
export FZF_CTRL_T_OPTS="--preview 'bat -n --color=always --line-range :500 {}'"
export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always {} | head -200'"
eval "$(fzf --zsh)"
export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
  --color=fg:#7cbba3,fg+:#d0d0d0,bg:-1,bg+:#090316
  --color=hl:#248eff,hl+:#53ff7e,info:#58ff69,marker:#ffffff
  --color=prompt:#00ff22,spinner:#00ff04,pointer:#00ff6f,header:#87afaf
  --color=gutter:#0d1320,border:#09aba8,separator:#0d1320,label:#aeaeae
  --color=query:#d9d9d9
  --border="rounded" --border-label="" --preview-window="border-rounded" --padding="1"
  --margin="1" --prompt="👨🏻‍💻" --marker="" --pointer="🚀"
  --separator="" --scrollbar=""'

# Lazy Loading NVM (Carga diferida ultrarrápida de Node)
lazy_nvm(){
    unset -f nvm node npm npx
    export NVM_DIR="$HOME/.nvm"
    [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"
    [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"
}
nvm() { lazy_nvm; nvm "$@"; }
node() { lazy_nvm; node "$@"; }
npm() { lazy_nvm; npm "$@"; }
npx() { lazy_nvm; npx "$@"; }

# Directorios rápidos e historial inteligente
[ -f /opt/homebrew/opt/z.lua/share/z.lua/z.lua ] && eval "$(lua /opt/homebrew/opt/z.lua/share/z.lua/z.lua --init zsh)"
eval "$(atuin init zsh)"

# Autocompletado de Ngrok
if command -v ngrok &>/dev/null; then eval "$(ngrok completion)"; fi
