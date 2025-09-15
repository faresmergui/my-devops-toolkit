# 🛠️ My DevOps Toolkit

> **Personal DevOps configuration toolkit** to quickly reinstall a complete development environment on a new workstation with focus on **Kubernetes, Terraform, and Cloud automation**.

## 📋 Table of Contents

- [🎯 Purpose](#-purpose)  
- [🏗️ Project Structure](#️-project-structure)
- [🚀 Quick Installation](#-quick-installation)
- [📦 Configured Tools](#-configured-tools)
- [⚙️ Configuration by Tool](#️-configuration-by-tool)
- [🔗 Aliases](#-aliases)

## 🎯 Purpose

This repository contains a **complete DevOps environment setup** with configurations for **Kubernetes, Docker, Terraform, AWS**, and all essential development tools to instantly recreate my production-ready workspace on any macOS machine.

## 🏗️ Project Structure

```
MY-DEVOPS-TOOLKIT/
├── 📁 .config/                    # Application configurations
│   ├── 📁 eza/                    # Modern ls configuration
│   ├── 📁 fish/                   # Fish Shell configuration
│   ├── 📁 iterm2/                 # iTerm2 configuration (macOS)
│   ├── 📁 karabiner/              # Karabiner-Elements configuration (macOS)
│   ├── 📁 NotepadNext/            # Notepad Next configuration
│   ├── 📁 nvim/                   # Neovim configuration with LSP
│   ├── 📁 thefuck/                # The F*ck configuration
│   ├── 📁 wezterm/                # WezTerm terminal configuration
│   └── 📁 zellij/                 # Zellij multiplexer configuration
│
├── 📁 common/                     # Common shell configurations
│   ├── 📄 .bash_profile          # Bash profile configuration
│   ├── 📄 .bashrc                 # Bash runtime configuration
│   ├── 📄 .gitconfig              # Global Git configuration with delta
│   ├── 📄 .zprofile               # Zsh profile configuration
│   ├── 📄 .zshrc                  # Zsh runtime with powerlevel10k
│   ├── 📄 config.fish             # Fish shell configuration
│   └── 📄 init.lua                # Lua configuration (Neovim)
│
├── 📁 vscode/                     # Visual Studio Code configuration
│   ├── 📄 keybindings.json       # Custom keyboard shortcuts
│   ├── 📄 settings.json           # Editor settings with DevOps extensions
│   └── 📄 vscode-extensions.txt   # DevOps-focused extensions list
│
├── 📄 Brewfile                    # Complete DevOps stack installation
└── 📄 README.md                   # This file
```

## 🚀 Quick Installation

### **Prerequisites**
- macOS (Homebrew required)
- Administrator access
- Git installed

### **1. Clone the repository**
```bash
git clone https://github.com/[your-username]/my-devops-toolkit.git
cd my-devops-toolkit
```

### **2. Install complete DevOps stack**
```bash
# Install Homebrew if necessary
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install everything from Brewfile (this will take 15-20 minutes)
brew bundle --file=Brewfile --verbose

# VSCode extensions are included in the Brewfile
```

## 📦 Configured Tools

### **☁️ DevOps & Cloud Stack**
| Tool | Version | Description |
|------|---------|-------------|
| **AWS CLI** | Latest | Amazon Web Services command line |
| **kubectl** | Latest | Kubernetes cluster management |
| **helm** | Latest | Kubernetes package manager |
| **minikube** | Latest | Local Kubernetes development |
| **k9s** | Latest | Kubernetes terminal UI |
| **kubectx** | Latest | Switch Kubernetes contexts |
| **terraform** | Latest | Infrastructure as Code |
| **terraform-docs** | Latest | Generate Terraform documentation |
| **ansible** | Latest | Configuration management automation |

### **🐳 Containers & Virtualization**
| Tool | Description |
|------|-------------|
| **Podman** | Rootless container engine |
| **Docker Desktop** | Container development platform |
| **Lens** | Kubernetes IDE |

### **🛠️ Development Tools**
| Category | Tools | Features |
|----------|-------|----------|
| **🐚 Shells** | Fish, Zsh + Powerlevel10k | Modern shells with themes |
| **📟 Terminal** | WezTerm + Zellij | GPU-accelerated terminal + multiplexer |
| **📝 Editors** | Neovim + VSCode | Configured for DevOps workflows |
| **🔍 Search & Navigation** | fzf, ripgrep, fd, zoxide | Fast file/content search |
| **📊 Visualization** | bat, eza, git-delta | Enhanced CLI output |

## ⚙️ Configuration by Tool

### **🐚 Fish Shell** (`.config/fish/`)
- AWS CLI auto-completion
- Kubectl completions
- Terraform functions
- Custom DevOps aliases
- Environment variable management

### **📟 WezTerm** (`.config/wezterm/`)
- Optimized for terminal multiplexing
- Kubernetes context in statusbar
- Custom color scheme for DevOps tools
- Split panes for multi-cluster monitoring

### **📝 Neovim** (`.config/nvim/`)
- **LSP configured for**:
  - Terraform (`terraform-lsp`)
  - YAML/Kubernetes manifests
  - Docker files
  - Ansible playbooks
- **Plugins for DevOps**:
  - Terraform syntax highlighting
  - Kubernetes YAML validation
  - Git integration with fugitive

### **💻 VSCode Extensions** (included in Brewfile)
- **Kubernetes**: `ms-kubernetes-tools.vscode-kubernetes-tools`
- **Terraform**: `hashicorp.terraform`
- **Docker**: `ms-azuretools.vscode-docker`
- **Remote Development**: `ms-vscode-remote.remote-containers`
- **AI Assistance**: `github.copilot`, `github.copilot-chat`
- **DevOps Productivity**: `davidanson.vscode-markdownlint`, `redhat.vscode-yaml`

### **🔧 Git Configuration** (`common/.gitconfig`)
```ini
[core]
    pager = delta

[delta]
    navigate = true
    light = false
    line-numbers = true

[alias]
    tf = "!terraform"
    k = "!kubectl"
    pods = "!kubectl get pods"
```

## 🔗 Aliases

### **⚡ Kubernetes Aliases**
```bash
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
```

### **🏗️ Terraform Aliases**
```bash
# Basic terraform commands
alias tf='terraform'
alias tfi='terraform init'
alias tfp='terraform plan'
alias tfa='terraform apply'
alias tfd='terraform destroy'
alias tfs='terraform show'

# Terraform with auto-approve (use with caution)
alias tfaa='terraform apply -auto-approve'
alias tfda='terraform destroy -auto-approve'

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
```

### **☁️ AWS CLI Aliases**
```bash
# EC2 shortcuts
alias ec2ls='aws ec2 describe-instances --query "Reservations[*].Instances[*].[InstanceId,State.Name,Tags[?Key==`Name`].Value|[0]]" --output table'
alias ec2running='aws ec2 describe-instances --filters "Name=instance-state-name,Values=running" --query "Reservations[*].Instances[*].[InstanceId,Tags[?Key==`Name`].Value|[0]]" --output table'

# S3 shortcuts  
alias s3ls='aws s3 ls'
alias s3sync='aws s3 sync'

# IAM shortcuts
alias whoami='aws sts get-caller-identity'
alias awsprofile='echo $AWS_PROFILE'

# CloudFormation
alias cfls='aws cloudformation list-stacks'
alias cfstatus='aws cloudformation describe-stacks'
```

### **🐳 Container Aliases**
```bash
# Docker shortcuts
alias d='docker'
alias dps='docker ps'
alias dpsa='docker ps -a'
alias di='docker images'
alias drmi='docker rmi'
alias drun='docker run -it --rm'
alias dexec='docker exec -it'

# Podman shortcuts (rootless alternative)
alias p='podman'
alias pps='podman ps'
alias ppsa='podman ps -a'
alias pi='podman images'
alias prmi='podman rmi'
alias prun='podman run -it --rm'
alias pexec='podman exec -it'

# Clean up commands
alias dclean='docker system prune -af'
alias pclean='podman system prune -af'
```

### **🔧 System & Navigation Aliases**
```bash
# Enhanced ls with eza
alias ls='eza --icons'
alias ll='eza -la --icons'
alias lt='eza --tree --icons'
alias la='eza -la --icons'

# Enhanced search
alias find='fd'
alias grep='rg'

# Enhanced cat
alias cat='bat'

# Git shortcuts with delta
alias g='git'
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gp='git push'
alias gl='git pull'
alias glog='git log --oneline --graph --decorate'
alias gdiff='git diff'

# Directory navigation with zoxide
alias cd='z'
alias cdi='zi'  # Interactive mode

# System monitoring
alias top='htop'
alias df='df -h'
alias free='free -h'

# Quick edits
alias vim='nvim'
alias vi='nvim'
alias zshrc='nvim ~/.zshrc'
alias fishrc='nvim ~/.config/fish/config.fish'
```

### **🚀 Development Aliases**
```bash
# Python
alias py='python3'
alias pip='pip3'
alias venv='python3 -m venv'
alias activate='source venv/bin/activate'

# Node.js (if installed)
alias ni='npm install'
alias ns='npm start'
alias nr='npm run'

# Quick file operations
alias mkdir='mkdir -p'
alias cp='cp -r'
alias mv='mv -i'
alias rm='rm -i'

# Network
alias ping='ping -c 5'
alias ports='netstat -tuln'
alias myip='curl ifconfig.me'

# Archive extraction
alias untar='tar -xvf'
alias ungzip='gunzip'
```
