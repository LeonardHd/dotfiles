#!/bin/sh

############################################################
# This script installs the dotfiles and is used
# by codespaces to set up the dev container.
############################################################

# -e: exit on error
# -u: exit on unset variables
set -eu

CONFIG_FILE="${HOME}/.dotfiles_config"

# Default values
name=""
email=""

# export variables for debugging
export

# output .dotfiles_config if it exists
if [ -f "$CONFIG_FILE" ]; then
  echo "Config file: $CONFIG_FILE"
  echo "Contents:"
  cat "$CONFIG_FILE"
  echo
fi

# Parse arguments
while [ "$#" -gt 0 ]; do
  case "$1" in
    --name)
      name="$2"
      shift 2
      ;;
    --email)
      email="$2"
      shift 2
      ;;
    *)
      echo "Unknown argument: $1" >&2
      exit 1
      ;;
  esac
done

# Read from config file if arguments were not provided
if [ -f "$CONFIG_FILE" ]; then
  name="${name:-$(grep '^name=' "$CONFIG_FILE" | cut -d'=' -f2)}"
  email="${email:-$(grep '^email=' "$CONFIG_FILE" | cut -d'=' -f2)}"
fi

# Default fallback
name="${name:-"Leonard Herold"}"
email="${email:-"92177433+LeonardHd@users.noreply.github.com"}"



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

# POSIX way to get script's dir: https://stackoverflow.com/a/29834779/12156188
script_dir="$(cd -P -- "$(dirname -- "$(command -v -- "$0")")" && pwd -P)"

# If in the dofiles repo and in Codespaces
# use the /workespaces/dotfiles directory
# assumes CODESPACES is set and RepositoryName==dotfiles
if [ -d /workspaces/dotfiles ] && [ "${CODESPACES:-}" = "true" ]; then
  script_dir="/workspaces/dotfiles"
fi

set -- init --apply --data "name=${name}" --data "email=${email}" --source="${script_dir}"

echo "Running 'chezmoi $*'" >&2
# exec: replace current process with chezmoi
exec "$chezmoi" "$@"
