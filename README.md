# dotfiles

This repository contains personal dotfiles, configuration files, and helpful notes for various applications and tools and uses [chezmoi](https://www.chezmoi.io/).

## Configure for new environments

Install chezmoi via script:
```bash
cd ~
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply --data=false LeonardHd
```

## Codespaces

GitHub Codespaces uses the `install.sh` script to set up the environment.
So dotfiles are automatically installed when creating a new codespace (even in
this repository).

To apply local changes to the codespace, run the following command in the terminal
(assuming PWD is root of the dotfiles)

```bash
chezmoi init --apply --data=false --source=.
```

## Dev container VSCode Settings

VSCode allows customization of the development container via dotfiles.

Use the following user settings to enable dotfiles in the dev container:

```json
{
    "dotfiles.repository": "LeonardHd/dotfiles",
    "dotfiles.targetPath": "~/dotfiles",
    "dotfiles.installCommand": "install.sh",
}
```

### Additional information on Codespaces

- The `install.sh` script is run in the codespace environment.  
  See <https://docs.github.com/en/codespaces/setting-your-user-preferences/personalizing-github-codespaces-for-your-account#dotfiles> for more information.
- To see creation logs in the codespace, use the `View Creation Log` command or check the file `/workspaces/.codespaces/.persistedshare/creation.log`.
