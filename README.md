# My DevOps Toolkit

Personal dotfiles for macOS (MacBook Pro, Mac mini) and Omarchy (Arch Linux), managed with [chezmoi](https://www.chezmoi.io/). One command sets up a new machine: packages, shell, terminal, editors and DevOps tooling.

## Install on a new machine

```bash
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply faresmergui/my-devops-toolkit
```

This installs chezmoi, clones this repo, asks once for the Git email to use on this machine, installs packages (Homebrew on macOS, pacman on Omarchy), then writes the config files into `~`.

To preview first, replace `--apply` with nothing, then run `chezmoi diff` and `chezmoi apply`.

## Daily use

| Command | What it does |
| --- | --- |
| `ce ~/.zshrc` | Edit a managed file and apply it (`chezmoi edit --apply`) |
| `cre ~/.zshrc` | Pull back a change made directly in `~` (`chezmoi re-add`) |
| `cdiff` | Show what differs between the repo and `~` |
| `chezmoi update` | Pull the latest repo version and apply it |

Once a day, the shell warns if a managed file was changed outside chezmoi.

## Layout

Everything under `home/` mirrors the home directory. chezmoi copies each file to the same place under `~`, turning the `dot_` prefix into a leading dot (`home/dot_zshrc` becomes `~/.zshrc`). Files ending in `.tmpl` are templates that adapt to the OS. Everything outside `home/` stays in the repo.

```
.
├── home/                         # what chezmoi deploys into ~
│   ├── .chezmoi.toml.tmpl        # per-machine settings (OS, Git email)
│   ├── .chezmoiignore            # files skipped per OS
│   ├── .chezmoiexternal.toml     # third-party files (fzf-git.sh), pinned
│   ├── .chezmoiscripts/          # package installation scripts
│   ├── .chezmoitemplates/        # shared content (VS Code settings)
│   ├── dot_zshrc, dot_zprofile.tmpl, dot_gitconfig.tmpl, dot_bashrc
│   ├── dot_config/               # ~/.config: zsh/, ghostty/, zellij/, nvim/, starship.toml…
│   └── private_Library/          # macOS-only app settings (VS Code)
├── packages/
│   ├── Brewfile                  # macOS packages, apps and VS Code extensions
│   ├── Brewfile.security         # optional security tools
│   └── omarchy.txt               # extra pacman packages for Omarchy
└── docs/                         # migration notes and how-tos
```

## Stack

- **Terminal**: Ghostty + Zellij
- **Shell**: zsh, Starship prompt, autosuggestions, syntax highlighting, carapace completions
- **CLI**: eza, bat, fd, ripgrep, fzf, zoxide, git-delta, lazygit, jq, yq, htop
- **Editors**: VS Code, Neovim (lazy.nvim, LSP via mason)
- **DevOps**: AWS CLI, kubectl, helm, k9s, kubectx, minikube, Terraform, terraform-docs, Ansible, Podman, Multipass
- **macOS apps**: Raycast, Karabiner-Elements, Ice, Obsidian, DockDoor, FineTune, OnlySwitch

Shell aliases live in `home/dot_config/zsh/`, one file per topic (`k8s.zsh`, `terraform.zsh`, `aws.zsh`, …).

## Docs

- [Trying it safely without touching the current setup](docs/tester-sans-risque.md)
- [Migrating an existing Mac](docs/migration-mac.md)
- [Adding a tool](docs/ajouter-un-outil.md)

## License

MIT
