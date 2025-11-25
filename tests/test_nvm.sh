#!/usr/bin/env bash

# Check if nvm is available
if ! docker run chezmoi-test bash -l -c "command -v nvm" >/dev/null; then
    echo "nvm is not installed"
    exit 1
fi
