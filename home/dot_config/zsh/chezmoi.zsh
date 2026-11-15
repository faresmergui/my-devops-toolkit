# Dotfiles : modifier via chezmoi pour que le dépôt reste à jour
alias ce='chezmoi edit --apply'
alias cdiff='chezmoi diff'
alias cre='chezmoi re-add'

# Rappel une fois par jour si un fichier géré a été modifié hors de chezmoi
() {
  command -v chezmoi >/dev/null || return
  local stamp="${XDG_CACHE_HOME:-$HOME/.cache}/chezmoi-status-check"
  [[ -f $stamp && -n $(find "$stamp" -mtime -1 2>/dev/null) ]] && return
  mkdir -p "${stamp:h}" && touch "$stamp"
  if [[ -n $(chezmoi status --exclude=scripts 2>/dev/null) ]]; then
    print -P "%F{yellow}chezmoi : des fichiers diffèrent du dépôt. Voir \`chezmoi diff\`, puis \`chezmoi re-add\` ou \`chezmoi apply\`.%f"
  fi
}
