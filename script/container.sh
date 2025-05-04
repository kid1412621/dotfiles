#!/bin/bash
set -eou pipefail

source $(dirname "${BASH_SOURCE[0]}")/util.sh

PKG_MGR=$(package_manager)


case "$PKG_MGR" in
brew)
  echo "Installing container related packages from Brewfile..."
  brew bundle install --file="$(dirname "$0")/../container.Brewfile"
  ;;
*)
  # lazydocker
  curl -fsSL https://raw.githubusercontent.com/jesseduffield/lazydocker/master/scripts/install_update_linux.sh | bash
  ;;
esac

