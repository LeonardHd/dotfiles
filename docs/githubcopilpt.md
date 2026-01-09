# GitHub Copilot

GitHub Copilot supports workspace and user instruction and prompt files. 
While workspace files are stored in the repository, user files are stored in the VSCode user settings directory.

To persist user instruction and prompt files across Codespaces and Dev Containers,
I prefer to symlink them from a dotfile directory in my home directory/workspace.

## GitHub Settings ideally synced via GitHub Settings Sync

```json
"chat.instructionsFilesLocations": {
    ".github/instructions": true,
    "~/.gcplhd/instructions": true
},
"chat.promptFilesLocations": {
    "~/.gcplhd/prompts": true,
    ".github/prompts": true,
}
```

## GitHub Copilot Terminal Customization

```json

"chat.tools.terminal.terminalProfile.linux": {
        "path": "bash", // Use Bash instead of Zsh
        "args": [], // Launch as a non-login shell (no `-l` needed)
        "env": {
            "COPILOT": "1" // Optional flag to detect Copilot sessions in shell init
        }
},
```
