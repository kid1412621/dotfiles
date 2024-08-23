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
      sudo apt update -qq && sudo apt install -qq -y "$package"
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

install_package "${apps_to_install[@]}"

SCRIPT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
cd "$SCRIPT_DIR"
echo "$SCRIPT_DIR"

# update vim plugins
git submodule update --init --recursive
echo "All Vim plugins updated."

stow --adopt .
