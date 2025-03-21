.PHONY: all core gui python install_core_packages install_extra_packages update_vim_plugins install_gui_app install_python create_symlinks

all: install_extra_packages

core: install_core_packages update_vim_plugins create_symlinks

gui: install_gui_app

python: install_python


install_core_packages:
	@echo "Installing core apps..."
	@./script/install.sh

install_extra_packages: install_core_packages
	@echo "Installing extra apps..."
	@./script/extra.sh

install_gui_app: install_extra_packages
	@echo "Installing gui apps..."
	@./script/gui.sh

install_python: install_core_packages
	@echo "Installing python apps..."
	@./script/python.sh

update_vim_plugins: 
	@git submodule update --init --recursive
	@echo "All Vim plugins updated."

create_symlinks: update_vim_plugins
	stow --adopt -t $(HOME) .
