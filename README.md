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

## Development

```bash
chezmoi init --apply --data=false --source=.
```

## Codespaces

> To see logs in codespaces use `View Creation Log` command or `/workspaces/.codespaces/.persistedshare/creation.log`