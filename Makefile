.PHONY: all setup install_packages update_plugins

all: setup update_plugins

setup: install_packages create_symlinks

install_packages:
	./script/install.sh

update_plugins:
	git submodule update --init --recursive
	echo "All Vim plugins updated."

create_symlinks:
	stow --adopt -t $(HOME) .
