#!/bin/bash
set -eou pipefail

source $(dirname "${BASH_SOURCE[0]}")/util.sh

APPS=("curl" "stow" "vim" "tmux" "bat" "fzf")
OS_TYPE=$(os)
PKG_MANAGER=$(package_manager)

# Check if a package manager was found
if [ -z "$PKG_MANAGER" ]; then
  echo "No supported package manager found."
  exit 1
fi

# install brew if missing on MacOS
if [[ $OS_TYPE = "Darwin" ]] && ! cmd_exists brew; then
  curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh | bash
fi

$(package_install_cmd) "${APPS[@]}"

# Determine the current default shell
case "$SHELL" in
*/zsh)
  SHELL_RC=".zshrc"
  if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo "Installing Oh My Zsh..."
    curl -fsSL https://install.ohmyz.sh/ | sh
  fi
  ;;
*/bash)
  SHELL_RC=".bashrc"
  if [ ! -d "$HOME/.oh-my-bash" ]; then
    echo "Installing Oh My Bash..."
    curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh | bash
  fi
  ;;
*)
  echo "Skip for other shell (not zsh or bash)."
  ;;
esac
