#!/bin/bash
set -eou pipefail

source $(dirname "${BASH_SOURCE[0]}")/util.sh

PKG_MGR=$(package_manager)


case "$PKG_MGR" in
brew)
  echo "Installing packages from Brewfile..."
  brew tap homebrew/bundle
  brew bundle install --file=../Brewfile
  ;;
esac

