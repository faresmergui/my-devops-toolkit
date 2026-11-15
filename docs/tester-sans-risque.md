# Tester sans toucher à ton environnement

Tout se passe dans un dossier de test qui joue le rôle de `~`. Ton vrai `~/.zshrc`, WezTerm et tes outils actuels ne changent pas.

## 1. Préparer (ajouts uniquement)

```bash
brew install chezmoi starship
cd ~/Documents/Projects/my-devops-toolkit
git fetch origin && git switch chezmoi-migration
```

Installer chezmoi et starship ne change rien à ton shell actuel : ils ne servent que si un fichier de conf les appelle.

## 2. Générer la config dans un faux home

```bash
mkdir -p ~/chezmoi-test
HOME=~/chezmoi-test chezmoi init --source ~/Documents/Projects/my-devops-toolkit --apply --exclude=scripts
```

`--exclude=scripts` empêche l'installation des paquets Homebrew. Tu peux ouvrir `~/chezmoi-test` pour regarder les fichiers produits.

## 3. Essayer le nouveau shell

```bash
HOME=~/chezmoi-test zsh -l
```

Tu es dans le nouveau zsh (Starship, alias, fzf, zellij…). Tape `exit` pour revenir à ton shell habituel.

## 4. Voir ce qui changerait sur ton vrai home (lecture seule)

```bash
chezmoi --config ~/chezmoi-test/.config/chezmoi/chezmoi.toml \
  --source ~/Documents/Projects/my-devops-toolkit diff --exclude=scripts
```

Ça affiche les différences avec tes fichiers actuels, sans rien écrire.

## 5. Essayer Ghostty (optionnel)

```bash
brew install --cask ghostty
mkdir -p ~/.config/ghostty && cp ~/chezmoi-test/.config/ghostty/config ~/.config/ghostty/config
```

Seul Ghostty lit ce fichier, WezTerm continue de fonctionner comme avant. Dans Ghostty, lance `HOME=~/chezmoi-test zsh -l` pour voir l'ensemble.

## Tout annuler

```bash
rm -rf ~/chezmoi-test ~/.config/ghostty
cd ~/Documents/Projects/my-devops-toolkit && git switch main
```
