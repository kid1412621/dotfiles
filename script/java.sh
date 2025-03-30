#!/bin/bash
set -eou pipefail

source $(dirname "${BASH_SOURCE[0]}")/util.sh

PKG_MGR=$(package_manager)


case "$PKG_MGR" in
brew)
  echo "Installing java related packages from Brewfile..."
  brew bundle install --file="$(dirname "$0")/../java.Brewfile"
  ;;
esac

