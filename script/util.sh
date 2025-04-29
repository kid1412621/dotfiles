#!/bin/bash

cmd_exists() {
  command -v "$1" >/dev/null 2>&1
}

os() {
  local OS=$(uname -s)
  if [[ $OS = "Darwin" ]]; then
    echo $OS
  else
    local distro=$(grep -oP '^ID=\K[^"]+' /etc/os-release)
    echo $distro
  fi
}

# NOTE: some packages using i386 or aarch64
cpu_arch() {
  local ARCH=$(uname -m)
  if [[ "$ARCH" == "x86_64" ]]; then
    echo $ARCH
  elif [[ "$ARCH" == "amd64" ]]; then
    echo $ARCH
  elif [[ "$ARCH" == "aarch64" || "$ARCH" == "arm64" ]]; then
    echo "arm64"
  else
    exit 1
  fi
}

package_manager() {
  local os=$(os)
  if [[ $os = "Darwin" ]]; then
    echo "brew"
  elif [[ $os = "fedora" ]]; then
    echo "dnf"
  elif [[ $os = "debian" || $os = "ubuntu" ]]; then
    echo "apt"
  fi
}

package_install_cmd() {
  local os=$(os)
  if [[ $os = "Darwin" ]]; then
    echo "brew install --quiet"
  elif [[ $os = "fedora" ]]; then
    echo "sudo dnf install -y --quiet"
  elif [[ $os = "debian" || $os = "ubuntu" ]]; then
    sudo apt update > /dev/null 2>&1
    echo "sudo apt install -qq -y"
  fi
}

shell_rc() {
  case "$SHELL" in
  */zsh)
    echo ".zshrc"
    ;;
  */bash)
    echo ".bashrc"
    ;;
  esac
}
