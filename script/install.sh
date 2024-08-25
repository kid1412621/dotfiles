#!/bin/bash
set -eou pipefail

APPS=("curl" "stow" "vim" "neovim" "tmux" "bat" "fzf")
PKG_MANAGERS=("brew" "dnf" "apt")

# Detect package manager
for pkg_manager in "${PKG_MANAGERS[@]}"; do
    if command -v "$pkg_manager" >/dev/null 2>&1; then
        PKG_MANAGER="$pkg_manager"
        break
    fi
done

# Check if a package manager was found
if [ -z "$PKG_MANAGER" ]; then
  echo "No supported package manager found ($PKG_MANAGERS)."
  exit 1
fi

# install necessary packages
case "$PKG_MANAGER" in
    brew)
        brew install --quiet "${APPS[@]}"
        ;;
    dnf)
        sudo dnf install -y --quiet "${APPS[@]}"
        ;;
    apt)
        sudo apt update -qq
        sudo apt install -qq -y "${APPS[@]}"
        ;;
esac


# Determine the current default shell
case "$SHELL" in
    */zsh)
        if [ ! -d "$HOME/.oh-my-zsh" ]; then
            echo "Installing Oh My Zsh..."
            curl -fsSL https://install.ohmyz.sh/ | sh
        fi
        ;;
    */bash)
        if [ ! -d "$HOME/.oh-my-bash" ]; then
            echo "Installing Oh My Bash..."
            curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh | bash
        fi
        ;;
    *)
        echo "Skip for other shell (not zsh or bash)."
        ;;
esac
