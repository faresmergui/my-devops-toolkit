# Podman shortcuts (rootless alternative)
alias p='podman'
alias pps='podman ps'
alias ppsa='podman ps -a'
alias pi='podman images'
alias prmi='podman rmi'
alias prun='podman run -it --rm'
alias pexec='podman exec -it'
alias pclean='podman system prune -af'

# Docker shortcuts, seulement si docker est installé
if command -v docker >/dev/null; then
  alias d='docker'
  alias dps='docker ps'
  alias dpsa='docker ps -a'
  alias di='docker images'
  alias drmi='docker rmi'
  alias drun='docker run -it --rm'
  alias dexec='docker exec -it'
  alias dclean='docker system prune -af'
fi
