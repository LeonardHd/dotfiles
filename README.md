# dotfiles

Install chezmoi via script:
```bash
cd ~
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply --data=false LeonardHd
```

For dev container setup, run the following command:
```bash
chezmoi init --data=false --apply=true
```
