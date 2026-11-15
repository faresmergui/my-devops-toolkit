# Basic kubectl shortcuts
alias k='kubectl'
alias kgp='kubectl get pods'
alias kgs='kubectl get services'
alias kgd='kubectl get deployments'
alias kgn='kubectl get nodes'
alias kga='kubectl get all'

# Describe resources
alias kdp='kubectl describe pod'
alias kds='kubectl describe service'
alias kdd='kubectl describe deployment'

# Logs and debugging
alias kl='kubectl logs'
alias klf='kubectl logs -f'
alias kex='kubectl exec -it'

# Context and namespace switching
alias kctx='kubectx'
alias kns='kubens'
alias kcurrent='kubectl config current-context'

# Quick cluster info
alias kinfo='kubectl cluster-info'
alias ktop='kubectl top'
