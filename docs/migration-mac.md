# Migrer un Mac existant vers chezmoi

À faire une fois par Mac déjà installé. Sur une machine neuve, la commande du README suffit.

## 1. Sauvegarder

chezmoi écrase les fichiers qu'il gère. Garde une copie des fichiers actuels :

```bash
mkdir -p ~/dotfiles-backup
cp ~/.zshrc ~/.zprofile ~/.gitconfig ~/.bashrc ~/.bash_profile ~/dotfiles-backup/ 2>/dev/null
cp -R ~/.config ~/dotfiles-backup/config
cp "$HOME/Library/Application Support/Code/User/settings.json" ~/dotfiles-backup/vscode-settings.json
```

## 2. Brancher chezmoi sur ce dépôt

```bash
brew install chezmoi
chezmoi init --source ~/Documents/Projects/my-devops-toolkit
```

chezmoi demande l'email Git de cette machine, puis retient l'emplacement du dépôt.

## 3. Vérifier avant d'appliquer

```bash
chezmoi diff
```

Relis chaque différence. Rien n'est encore modifié.

## 4. Appliquer

```bash
chezmoi apply
```

Le premier `apply` lance aussi `brew bundle` : il installe ce qui manque (Ghostty, Starship, git-lfs…) et reprend les applis déjà présentes (`--adopt`). Ouvre ensuite Ghostty pour vérifier le terminal et le prompt.

## 5. Nettoyer (à la main, quand tout fonctionne)

Ces éléments ne sont plus utilisés. chezmoi ne supprime rien de lui-même :

```bash
rm -rf ~/.oh-my-zsh ~/.config/iterm2 ~/.config/fish ~/.config/wezterm
rm -f ~/.p10k.zsh ~/.wezterm.lua ~/fzf-git.sh ~/config.fish ~/init.lua ~/.zsh_history
rm -rf ~/Documents/Projects/my-devops-toolkit/_import
brew uninstall powerlevel10k fish
brew uninstall --cask wezterm warp lens hiddenbar
```

`~/.zsh_history` est l'ancien petit historique. Le vrai historique reste dans `~/.zhistory`.

## Bon à savoir

- htop et Karabiner réécrivent leur fichier de conf quand tu changes un réglage dans l'appli. Lance alors `cre ~/.config/htop/htoprc` (ou le fichier concerné) pour le remettre dans le dépôt.
- Les réglages VS Code sont gérés de la même façon : après un changement dans l'interface, `cre "$HOME/Library/Application Support/Code/User/settings.json"`.
