.PHONY: all install_packages update_plugins create_symlinks

all: install_packages update_plugins create_symlinks

install_packages:
	./script/install.sh

update_plugins: 
	git submodule update --init --recursive
	echo "All Vim plugins updated."

create_symlinks: update_plugins
	stow --adopt -t $(HOME) .
