#!/bin/sh

############################################################
# This script installs the dotfiles and is used
# by codespaces to set up the dev container.
############################################################

# -e: exit on error
# -u: exit on unset variables
set -eu


if ! chezmoi="$(command -v chezmoi)"; then
  bin_dir="${HOME}/.local/bin"
  chezmoi="${bin_dir}/chezmoi"
  echo "Installing chezmoi to '${chezmoi}'" >&2
  if command -v curl >/dev/null; then
    chezmoi_install_script="$(curl -fsSL https://chezmoi.io/get)"
  elif command -v wget >/dev/null; then
    chezmoi_install_script="$(wget -qO- https://chezmoi.io/get)"
  else
    echo "To install chezmoi, you must have curl or wget installed." >&2
    exit 1
  fi
  sh -c "${chezmoi_install_script}" -- -b "${bin_dir}"
  unset chezmoi_install_script bin_dir
fi

# Check whether we run in a codespace
# or build a devcontainer (via vscode)
if [ -d /workspaces/dotfiles ] && [ "${CODESPACES:-}" = "true" ]; then
  # If in the dofiles repo and in Codespaces
  # use the /workespaces/dotfiles directory
  # assumes CODESPACES is set and RepositoryName==dotfiles
  script_dir="/workspaces/dotfiles"
  set -- init --apply --data "remoteContainer=codespaces" --source="${script_dir}"
else
  # If not in Codespaces, use the script's directory
  # POSIX way to get script's dir: https://stackoverflow.com/a/29834779/12156188
  script_dir="$(cd -P -- "$(dirname -- "$(command -v -- "$0")")" && pwd -P)"
  set -- init --apply --data "remoteContainer=devcontainer" --source="${script_dir}"
fi

echo "Running 'chezmoi $*'" >&2
# exec: replace current process with chezmoi
exec "$chezmoi" "$@"
