# ─────────────────────────────────────────────────────────────
# ~/.zshrc — Engel's clean power config
# macOS + Ghostty + modern CLI tools
# ─────────────────────────────────────────────────────────────

# ─────────────────────────────────────────────────────────────
# Basics
# ─────────────────────────────────────────────────────────────

export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
export EDITOR="nvim"
export VISUAL="nvim"
export PAGER="less"
export MANPAGER="sh -c 'col -bx | bat -l man -p 2>/dev/null || col -bx | less'"

HISTFILE="$HOME/.zsh_history"
HISTSIZE=100000
SAVEHIST=100000

setopt APPEND_HISTORY
setopt SHARE_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_REDUCE_BLANKS
setopt EXTENDED_HISTORY
setopt INC_APPEND_HISTORY
setopt AUTO_CD
setopt CORRECT
setopt COMPLETE_IN_WORD
setopt ALWAYS_TO_END
setopt INTERACTIVE_COMMENTS

unsetopt BEEP

# ─────────────────────────────────────────────────────────────
# PATH
# ─────────────────────────────────────────────────────────────

export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/bin:$PATH"

# Homebrew Apple Silicon
if [[ -d "/opt/homebrew/bin" ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Homebrew Intel fallback
if [[ -d "/usr/local/bin" ]]; then
  export PATH="/usr/local/bin:$PATH"
fi

# Rust / Cargo
if [[ -d "$HOME/.cargo/bin" ]]; then
  export PATH="$HOME/.cargo/bin:$PATH"
fi

# Go
if [[ -d "$HOME/go/bin" ]]; then
  export GOPATH="$HOME/go"
  export PATH="$GOPATH/bin:$PATH"
fi

# Bun
if [[ -d "$HOME/.bun/bin" ]]; then
  export BUN_INSTALL="$HOME/.bun"
  export PATH="$BUN_INSTALL/bin:$PATH"
fi

# pnpm
if [[ -d "$HOME/Library/pnpm" ]]; then
  export PNPM_HOME="$HOME/Library/pnpm"
  export PATH="$PNPM_HOME:$PATH"
fi

# ─────────────────────────────────────────────────────────────
# Completion
# ─────────────────────────────────────────────────────────────

autoload -Uz compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zmodload zsh/complist

# Быстрый compinit cache
if [[ -n "$HOME/.zcompdump" ]]; then
  compinit -d "$HOME/.zcompdump"
else
  compinit
fi

# ─────────────────────────────────────────────────────────────
# Keybinds
# ─────────────────────────────────────────────────────────────

bindkey -e

# Ctrl + A / E
bindkey '^A' beginning-of-line
bindkey '^E' end-of-line

# Ctrl + Left / Right, Option + Left / Right
bindkey '^[[1;5D' backward-word
bindkey '^[[1;5C' forward-word
bindkey '^[b' backward-word
bindkey '^[f' forward-word

# Delete word
bindkey '^W' backward-kill-word

# History search by prefix
autoload -Uz up-line-or-beginning-search
autoload -Uz down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey '^[[A' up-line-or-beginning-search
bindkey '^[[B' down-line-or-beginning-search

# ─────────────────────────────────────────────────────────────
# Better ls: eza fallback to ls
# ─────────────────────────────────────────────────────────────

if command -v eza >/dev/null 2>&1; then
  alias ls='eza --group-directories-first'
  alias l='eza -lah --group-directories-first'
  alias ll='eza -lh --group-directories-first'
  alias la='eza -lah --group-directories-first'
  alias lt='eza --tree --level=2 --group-directories-first'
  alias tree='eza --tree --group-directories-first'
else
  alias ls='ls -G'
  alias l='ls -lah'
  alias ll='ls -lh'
  alias la='ls -lah'
fi

# ─────────────────────────────────────────────────────────────
# Better cat: bat fallback to cat
# ─────────────────────────────────────────────────────────────

if command -v bat >/dev/null 2>&1; then
  alias cat='bat --paging=never'
  alias less='bat'
fi

# ─────────────────────────────────────────────────────────────
# Core aliases
# ─────────────────────────────────────────────────────────────

alias c='clear'
alias q='exit'
alias reload='source ~/.zshrc'
alias zshrc='nvim ~/.zshrc'
alias ghosttyrc='nvim ~/.config/ghostty/config.ghostty'

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias ~='cd ~'
alias dot='cd ~/dotfiles 2>/dev/null || cd ~/.config'

alias mkdir='mkdir -p'
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

alias path='echo $PATH | tr ":" "\n"'
alias ports='lsof -i -P -n | grep LISTEN'
alias myip='curl -s https://ifconfig.me && echo'
alias weather='curl wttr.in'

# macOS
alias finder='open .'
alias showfiles='defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder'
alias hidefiles='defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder'
alias flushdns='sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder'

# ─────────────────────────────────────────────────────────────
# Git aliases
# ─────────────────────────────────────────────────────────────

alias g='git'
alias gs='git status --short'
alias gst='git status'
alias ga='git add'
alias gaa='git add .'
alias gc='git commit'
alias gcm='git commit -m'
alias gp='git push'
alias gpl='git pull'
alias gl='git log --oneline --graph --decorate --all'
alias gd='git diff'
alias gds='git diff --staged'
alias gb='git branch'
alias gco='git checkout'
alias gcb='git checkout -b'
alias gr='git restore'
alias grs='git restore --staged'

if command -v lazygit >/dev/null 2>&1; then
  alias lg='lazygit'
fi

# ─────────────────────────────────────────────────────────────
# Neovim
# ─────────────────────────────────────────────────────────────

if command -v nvim >/dev/null 2>&1; then
  alias vim='nvim'
  alias vi='nvim'
  alias v='nvim'
fi

# ─────────────────────────────────────────────────────────────
# Search tools
# ─────────────────────────────────────────────────────────────

export RIPGREP_CONFIG_PATH="$HOME/.config/rg/ripgreprc"

if command -v rg >/dev/null 2>&1; then
  alias grep='rg'
  alias search='rg -n'
fi

if command -v fd >/dev/null 2>&1; then
  alias find='fd'
fi

# ─────────────────────────────────────────────────────────────
# fzf
# ─────────────────────────────────────────────────────────────

export FZF_DEFAULT_OPTS="
  --height=45%
  --layout=reverse
  --border=rounded
  --info=inline
  --prompt='❯ '
  --pointer='❯'
  --marker='•'
  --color=fg:#d8f4ff,bg:-1,hl:#9fe7f7
  --color=fg+:#eefbff,bg+:#12384f,hl+:#9fe7f7
  --color=info:#8fb6c9,prompt:#5cc8ff,pointer:#5cc8ff
  --color=marker:#d9cb93,spinner:#9fe7f7,header:#8fb6c9
  --color=border:#2c92c8
"

export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git --exclude node_modules'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND='fd --type d --hidden --follow --exclude .git --exclude node_modules'

if command -v fd >/dev/null 2>&1; then
  export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
  export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
fi

if command -v fzf >/dev/null 2>&1; then
  # Homebrew fzf integration
  if [[ -f "/opt/homebrew/opt/fzf/shell/key-bindings.zsh" ]]; then
    source "/opt/homebrew/opt/fzf/shell/key-bindings.zsh"
  fi

  if [[ -f "/opt/homebrew/opt/fzf/shell/completion.zsh" ]]; then
    source "/opt/homebrew/opt/fzf/shell/completion.zsh"
  fi
fi

# Fuzzy cd
fcd() {
  local dir
  dir=$(fd --type d --hidden --exclude .git 2>/dev/null | fzf) && cd "$dir"
}

# Fuzzy edit
fv() {
  local file
  file=$(fd --type f --hidden --exclude .git 2>/dev/null | fzf) && nvim "$file"
}

# Fuzzy kill process
fkill() {
  local pid
  pid=$(ps -ef | sed 1d | fzf | awk '{print $2}')
  [[ -n "$pid" ]] && kill -9 "$pid"
}

# ─────────────────────────────────────────────────────────────
# zoxide — smarter cd
# ─────────────────────────────────────────────────────────────

if command -v zoxide >/dev/null 2>&1; then
  eval "$(zoxide init zsh)"
  alias cd='z'
  alias cdi='zi'
fi

# ─────────────────────────────────────────────────────────────
# atuin — better history
# ─────────────────────────────────────────────────────────────

if command -v atuin >/dev/null 2>&1; then
  eval "$(atuin init zsh)"
fi

# ─────────────────────────────────────────────────────────────
# direnv
# ─────────────────────────────────────────────────────────────

if command -v direnv >/dev/null 2>&1; then
  eval "$(direnv hook zsh)"
fi

# ─────────────────────────────────────────────────────────────
# yazi
# ─────────────────────────────────────────────────────────────

if command -v yazi >/dev/null 2>&1; then
  alias y='yazi'

  yy() {
    local tmp
    tmp="$(mktemp -t yazi-cwd.XXXXXX)"
    yazi "$@" --cwd-file="$tmp"
    if cwd="$(cat "$tmp")" && [[ -n "$cwd" && "$cwd" != "$PWD" ]]; then
      cd "$cwd"
    fi
    rm -f "$tmp"
  }
fi

# ─────────────────────────────────────────────────────────────
# tmux
# ─────────────────────────────────────────────────────────────

if command -v tmux >/dev/null 2>&1; then
  alias ta='tmux attach -t'
  alias tn='tmux new -s'
  alias tl='tmux list-sessions'
fi

# ─────────────────────────────────────────────────────────────
# Docker
# ─────────────────────────────────────────────────────────────

if command -v docker >/dev/null 2>&1; then
  alias d='docker'
  alias dc='docker compose'
  alias dps='docker ps'
  alias di='docker images'
  alias dex='docker exec -it'
  alias dlog='docker logs -f'
fi

# ─────────────────────────────────────────────────────────────
# Node / JS
# ─────────────────────────────────────────────────────────────

alias ni='npm install'
alias nr='npm run'
alias nd='npm run dev'
alias nb='npm run build'
alias nt='npm test'

if command -v pnpm >/dev/null 2>&1; then
  alias pi='pnpm install'
  alias pr='pnpm run'
  alias pd='pnpm dev'
  alias pb='pnpm build'
  alias pt='pnpm test'
fi

if command -v bun >/dev/null 2>&1; then
  alias bi='bun install'
  alias br='bun run'
  alias bd='bun run dev'
  alias bb='bun run build'
  alias bt='bun test'
fi

# nvm
export NVM_DIR="$HOME/.nvm"
if [[ -s "$NVM_DIR/nvm.sh" ]]; then
  source "$NVM_DIR/nvm.sh"
fi

# ─────────────────────────────────────────────────────────────
# Python
# ─────────────────────────────────────────────────────────────

alias py='python3'
alias pip='python3 -m pip'
alias venv='python3 -m venv .venv'
alias va='source .venv/bin/activate'

if command -v uv >/dev/null 2>&1; then
  alias uvi='uv pip install'
  alias uvv='uv venv'
  alias uvr='uv run'
fi

if command -v pyenv >/dev/null 2>&1; then
  export PYENV_ROOT="$HOME/.pyenv"
  export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init -)"
fi

# ─────────────────────────────────────────────────────────────
# Rust
# ─────────────────────────────────────────────────────────────

if command -v cargo >/dev/null 2>&1; then
  alias cb='cargo build'
  alias cr='cargo run'
  alias ct='cargo test'
  alias cc='cargo check'
fi

# ─────────────────────────────────────────────────────────────
# Nix fallback
# ─────────────────────────────────────────────────────────────

if [[ -e "/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh" ]]; then
  source "/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh"
fi

# ─────────────────────────────────────────────────────────────
# AeroSpace
# ─────────────────────────────────────────────────────────────

if [[ -x "/run/current-system/sw/bin/aerospace" ]]; then
  alias aero='/run/current-system/sw/bin/aerospace'
elif command -v aerospace >/dev/null 2>&1; then
  alias aero='aerospace'
fi

# ─────────────────────────────────────────────────────────────
# Useful functions
# ─────────────────────────────────────────────────────────────

mkcd() {
  mkdir -p "$1" && cd "$1"
}

take() {
  mkdir -p "$1" && cd "$1"
}

extract() {
  if [[ -f "$1" ]]; then
    case "$1" in
    *.tar.bz2) tar xjf "$1" ;;
    *.tar.gz) tar xzf "$1" ;;
    *.bz2) bunzip2 "$1" ;;
    *.rar) unrar x "$1" ;;
    *.gz) gunzip "$1" ;;
    *.tar) tar xf "$1" ;;
    *.tbz2) tar xjf "$1" ;;
    *.tgz) tar xzf "$1" ;;
    *.zip) unzip "$1" ;;
    *.Z) uncompress "$1" ;;
    *.7z) 7z x "$1" ;;
    *) echo "Cannot extract: $1" ;;
    esac
  else
    echo "File not found: $1"
  fi
}

serve() {
  local port="${1:-8000}"
  python3 -m http.server "$port"
}

cleanup_ds() {
  find . -name ".DS_Store" -type f -delete
}

# Create project quickly
project() {
  mkdir -p "$1"
  cd "$1" || return
  git init
  touch README.md
  nvim README.md
}

# ─────────────────────────────────────────────────────────────
# Prompt
# ─────────────────────────────────────────────────────────────

if command -v starship >/dev/null 2>&1; then
  eval "$(starship init zsh)"
else
  PROMPT='%F{cyan}%n@%m%f %F{blue}%~%f %# '
fi

# ─────────────────────────────────────────────────────────────
# Startup message — минимальный, без мусора
# ─────────────────────────────────────────────────────────────

export PATH="$HOME/.local/bin:$PATH"

clear
