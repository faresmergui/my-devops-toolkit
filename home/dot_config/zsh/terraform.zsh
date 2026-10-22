# Basic terraform commands
# (pas d'alias -auto-approve : un apply ou un destroy doit toujours être confirmé)
alias tf='terraform'
alias tfi='terraform init'
alias tfp='terraform plan'
alias tfa='terraform apply'
alias tfd='terraform destroy'
alias tfs='terraform show'

# Workspace management
alias tfw='terraform workspace'
alias tfws='terraform workspace select'
alias tfwl='terraform workspace list'

# Validation and formatting
alias tfv='terraform validate'
alias tff='terraform fmt'
alias tfdocs='terraform-docs markdown . > README.md'

# State management
alias tfstate='terraform state'
alias tfrefresh='terraform refresh'
