# Historique : un seul fichier, partagé entre les shells
HISTFILE=$HOME/.zhistory
SAVEHIST=50000
HISTSIZE=50000
setopt share_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_verify

# completion using arrow keys (based on history)
bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward
