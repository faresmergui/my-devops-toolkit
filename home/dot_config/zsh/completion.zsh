# Complétion : compinit d'abord, une seule fois, puis carapace
autoload -U compinit && compinit

export CARAPACE_BRIDGES='zsh,bash'
command -v carapace >/dev/null && source <(carapace _carapace)
