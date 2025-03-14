.PHONY: all core gui install_core_packages install_extra_packages update_vim_plugins install_gui_app create_symlinks

all: core install_extra_packages

core: install_core_packages update_vim_plugins create_symlinks

gui: all install_gui_app


install_core_packages:
	@echo "Installing core apps..."
	@./script/install.sh

install_extra_packages: install_core_packages
	@echo "Installing extra apps..."
	@./script/extra.sh

install_gui_app: install_extra_packages
	@echo "Installing gui apps..."
	@./script/gui.sh

update_vim_plugins: 
	@git submodule update --init --recursive
	@echo "All Vim plugins updated."

create_symlinks: update_vim_plugins
	stow --adopt -t $(HOME) .
