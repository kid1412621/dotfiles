#!/bin/bash

APPS_TO_INSTALL=(
  "curl"
  "git"
  "tig"
  "vim"
  "neovim"
  "stow"
  "tmux"
  "bat"
)

PKG_MANAGER=$(command -v brew >/dev/null 2>&1 && echo "brew" || command -v dnf >/dev/null 2>&1 && echo "dnf" || command -v apt >/dev/null 2>&1 && echo "apt")

if [ -z "$PKG_MANAGER" ]; then
  echo "No supported package manager found (brew, apt, dnf)."
  exit 1
fi

[ "$PKG_MANAGER" = "brew" ] && brew install --quiet "${APPS_TO_INSTALL[@]}" ||
[ "$PKG_MANAGER" = "dnf" ] && sudo dnf install -y --quiet "${APPS_TO_INSTALL[@]}" ||
[ "$PKG_MANAGER" = "apt" ] && sudo apt update -qq && sudo apt install -qq -y "${APPS_TO_INSTALL[@]}"


# Determine the current default shell
case "$SHELL" in
    */zsh)
        if [ ! -d "$HOME/.oh-my-zsh" ]; then
            echo "Installing Oh My Zsh..."
	    sh -c "$(curl -fsSL https://install.ohmyz.sh/)"
        fi
        ;;
    */bash)
        if [ ! -d "$HOME/.oh-my-bash" ]; then
            echo "Installing Oh My Bash..."
            sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)"
        fi
        ;;
    *)
        echo "Skip for other shell (not zsh or bash)."
        ;;
esac


SCRIPT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
cd "$SCRIPT_DIR"

# update vim plugins
git submodule update --init --recursive
echo "All Vim plugins updated."

# create symblic links
stow --adopt -t $HOME .
