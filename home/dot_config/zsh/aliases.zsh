# Alias généraux. Les commandes système (find, grep, cp, whoami) ne sont plus
# remplacées : une commande copiée d'une doc doit se comporter comme prévu.

alias reload-zsh="source ~/.zshrc"
alias edit-zsh="chezmoi edit --apply ~/.zshrc"
alias zshrc="chezmoi edit --apply ~/.zshrc"

export COLORTERM=truecolor

# ---- Eza (better ls) -----
export EZA_CONFIG_DIR="$HOME/.config/eza"
# Aliases eza avec icônes
alias ls='eza --color=always --color-scale=all --color-scale-mode=gradient --icons=always --group-directories-first -1'
alias ll='eza --color=always --color-scale=all --color-scale-mode=gradient --icons=always --group-directories-first -l --git -h'
alias la='eza --color=always --color-scale=all --color-scale-mode=gradient --icons=always --group-directories-first -a'
alias lla='eza --color=always --color-scale=all --color-scale-mode=gradient --icons=always --group-directories-first -a -l --git -h'

# ----- Bat (better cat) -----
export BAT_THEME=Dracula
alias cat='bat'

# ---- Recherche : fd et rg gardent leur nom ----
alias ff='fd'

# ---- TheFuck : chargé au premier appel seulement (il ralentit le démarrage) ----
fk() {
  unfunction fk
  eval "$(thefuck --alias fk)"
  fk "$@"
}

# System monitoring
alias top='htop'
alias df='df -h'

alias vim='nvim'
alias vi='nvim'

# Python
alias py='python3'
alias pip='pip3'
alias venv='python3 -m venv'
alias activate='source venv/bin/activate'

# Node.js
alias ni='npm install'
alias ns='npm start'
alias nr='npm run'

# Quick file operations (demandent confirmation avant d'écraser)
alias mkdir='mkdir -p'
alias mv='mv -i'
alias rm='rm -i'

# Network
alias ping='ping -c 5'
alias myip='curl ifconfig.me'

# Archive extraction
alias untar='tar -xvf'
alias ungzip='gunzip'
