#!/bin/bash

# Function to detect package manager
detect_package_manager() {
  if command -v brew >/dev/null 2>&1; then
    PKG_MANAGER="brew"
  elif command -v dnf >/dev/null 2>&1; then
    PKG_MANAGER="dnf"
  elif command -v apt >/dev/null 2>&1; then
    PKG_MANAGER="apt"
  else
    echo "No supported package manager found (brew, apt, dnf)."
    exit 1
  fi
}

# Functions for package operations
install_package() {
  local package=$1
  case $PKG_MANAGER in
    brew)
      brew install --quiet "$package"
      ;;
    dnf)
      sudo dnf install -y --quiet "$package"
      ;;
    apt)
      sudo apt update && sudo apt install -y "$package"
      ;;
  esac
}

detect_package_manager
echo "Detected package manager: $PKG_MANAGER"

apps_to_install=(
  "git"
  "vim"
  "neovim"
  "tmux"
  "stow"
)

for app in "${apps_to_install[@]}"; do
  install_package "$app"
done

# update vim plugins
git submodule update --init --recursive
#PLUGIN_DIR=~/.vim/pack/plugins/start
#for dir in "$PLUGIN_DIR"/*; do
#  if [ -d "$dir/.git" ]; then
#    echo "Updating $(basename "$dir")..."
#    cd "$dir" || exit
#    git pull
#  fi
#done

echo "All Vim plugins updated."

stow --adopt .
