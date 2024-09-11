#!/bin/bash
set -eou pipefail

source $(dirname "${BASH_SOURCE[0]}")/util.sh

PKG_MGR=$(package_manager)

install_noevim() {
  local RC_FILE="$HOME/$(shell_rc)"
  local INSTALL_PATH="/opt/nvim-linux64"

  if ! cmd_exists nvim; then
    curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
    sudo rm -rf "$INSTALL_PATH"
    sudo tar -C /opt -xzf nvim-linux64.tar.gz
    rm nvim-linux64.tar.gz
    if ! grep -q "$INSTALL_PATH/bin" "$RC_FILE"; then
      echo 'export PATH="$PATH:/opt/nvim-linux64/bin"' >>"$RC_FILE"
    fi
  else
    # check neovim version (debian holding old version, lazyvim required neovim >= 0.9.0)
    local NVIM_VERSION=$(nvim -v | grep -oE '^NVIM v[0-9.]+' | sed 's/^NVIM v//' | sed 's/\.//g')
    if [[ $((10#$NVIM_VERSION)) -lt 90 ]]; then
      echo "reinstalling neovim with latest version"
      curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
      sudo $PKG_MGR remove -y neovim
      sudo rm -rf "$INSTALL_PATH"
      sudo tar -C /opt -xzf nvim-linux64.tar.gz
      rm nvim-linux64.tar.gz
      if ! grep -q "$INSTALL_PATH/bin" "$RC_FILE"; then
        echo 'export PATH="$PATH:/opt/nvim-linux64/bin"' >>"$RC_FILE"
      fi
    fi
  fi
}

case "$PKG_MGR" in
apt)
  install_noevim

  APPS=("bat" "ripgrep" "fd-find" "fzf")
  $(package_install_cmd) "${APPS[@]}"
  # symlink bat, fd
  mkdir -p ~/.local/bin
  ln -sf $(which batcat) ~/.local/bin/bat
  ln -sf $(which fdfind) ~/.local/bin/fd
  # zoxide
  if ! cmd_exists zoxide; then
    curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh
  fi
  # delta
  # debian under 13, cannot install via apt
  if ! cmd_exists delta; then
    delta_version=$(curl -s "https://api.github.com/repos/dandavison/delta/releases/latest" | grep -Po '"tag_name": "\K[^"]*')
    delta_deb_file="git-delta_${delta_version}_amd64.deb"
    curl -fLO "https://github.com/dandavison/delta/releases/latest/download/$delta_deb_file"
    sudo dpkg -i $delta_deb_file && rm $delta_deb_file
  fi
  # lazydocker
  if cmd_exists docker && ! cmd_exists lazydocker; then
    curl https://raw.githubusercontent.com/jesseduffield/lazydocker/master/scripts/install_update_linux.sh | bash
  fi
  ;;
dnf)
  APPS=("bat" "ripgrep" "fd-find" "fzf" "zoxide" "git-delta")
  $(package_install_cmd) "${APPS[@]}"
  ;;
brew)
  APPS=("bat" "ripgrep" "fd" "fzf" "zoxide" "git-delta" "neovim" "font-jetbrains-mono-nerd-font")
  $(package_install_cmd) "${APPS[@]}"
  ;;
esac

# Nerd fonts
# FONT_DIR=$HOME/.local/share/fonts
#
# mkdir -p $FONT_DIR
# cd $FONT_DIR && curl -OL https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.tar.xz
# tar xf JetBrainsMono.tar.xz
# rm JetBrainsMono.tar.xz
# sudo fc-cache -or
