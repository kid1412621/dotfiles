#!/bin/bash
set -eou pipefail

source $(dirname "${BASH_SOURCE[0]}")/util.sh

PKG_MGR=$(package_manager)


case "$PKG_MGR" in
brew)
  GENERAL_APPS=("swish" "google-chrome" "obsidian")
  DEV_APPS=("visual-studio-code" "android-studio" "intellij-idea" "orbstack")
  $(package_install_cmd) "${DEV_APPS[@]}" "${GENERAL_APPS[@]}"
  ;;
esac

