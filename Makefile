.PHONY: all install_core_packages install_extra_packages update_vim_plugins create_symlinks

all: install_core_packages install_extra_packages update_vim_plugins create_symlinks

core: install_core_packages update_vim_plugins create_symlinks

install_core_packages:
	@echo "Installing core apps..."
	@./script/install.sh

install_extra_packages: install_core_packages
	@echo "Installing extra apps..."
	@./script/extra.sh

update_vim_plugins: 
	@git submodule update --init --recursive
	@echo "All Vim plugins updated."

create_symlinks: update_vim_plugins
	stow --adopt -t $(HOME) .
