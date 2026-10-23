# Ajouter un outil

1. **Le paquet** : ajoute une ligne dans `packages/Brewfile` (macOS) et/ou `packages/omarchy.txt` (Omarchy). Au prochain `chezmoi apply`, le script d'installation se relance tout seul car le fichier a changé.
2. **Sa conf** : si elle existe déjà sur la machine, `chezmoi add ~/.config/<outil>`. Le fichier est copié dans `home/dot_config/<outil>/`.
3. **Une différence entre Mac et Omarchy ?** Transforme le fichier en template : `chezmoi chattr +template ~/.config/<outil>/<fichier>`, puis utilise `{{ if .isMac }}…{{ else }}…{{ end }}`.
4. **Un fichier qui ne doit exister que sur un OS** : ajoute son chemin dans `home/.chezmoiignore`, dans le bloc de l'OS où il ne doit pas aller.
5. **Commit et push** : `chezmoi cd`, puis `git add`, `git commit`, `git push`. Sur l'autre machine, `chezmoi update`.

Variables disponibles dans les templates : `.isMac`, `.isOmarchy`, `.email`, `.name`, et celles de chezmoi (`.chezmoi.os`, `.chezmoi.hostname`…).
