#!/bin/bash

os() {
  local OS=$(uname -s)
  if [[ $OS = "Darwin" ]]; then
    echo $OS
  else
    local distro=$(grep -oP '^ID=\K[^"]+' /etc/os-release)
    echo $distro
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
    echo "sudo apt install -qq -y"
  fi
}
