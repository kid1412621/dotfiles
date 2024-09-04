#!/bin/bash

source $(dirname "${BASH_SOURCE[0]}")/util.sh

OS_TYPE=$(os)

echo "$OS_TYPE"
echo "$(package_manager)"

# Nerd fonts

# FONT_DIR=$HOME/.local/share/fonts
#
# mkdir -p $FONT_DIR
# cd $FONT_DIR && curl -OL https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.tar.xz
# tar xf JetBrainsMono.tar.xz
# rm JetBrainsMono.tar.xz
# sudo fc-cache -fr
#
# brew install font-jetbrains-mono-nerd-font
