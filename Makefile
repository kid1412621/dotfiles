# Aliases
.PHONY: all
all: install_extra_packages

.PHONY: core
core: install_core_packages update_vim_plugins create_symlinks

.PHONY: gui
gui: install_gui_app

.PHONY: java
java: install_java

.PHONY: python
python: install_python

.PHONY: node
node: install_node

# Scripts
.PHONY: install_core_packages
install_core_packages:
	@echo "Installing core apps..."
	@./script/install.sh

.PHONY: install_extra_packages
install_extra_packages: install_core_packages
	@echo "Installing extra apps..."
	@./script/extra.sh

.PHONY: install_gui_app
install_gui_app: install_extra_packages
	@echo "Installing gui apps..."
	@./script/gui.sh

.PHONY: install_java
install_java: install_core_packages
	@echo "Installing java apps..."
	@./script/java.sh

.PHONY: install_python
install_python: install_core_packages
	@echo "Installing python apps..."
	@./script/python.sh

.PHONY: install_node
install_node: install_core_packages
	@echo "Installing nodejs apps..."
	@./script/node.sh

.PHONY: update_vim_plugins
update_vim_plugins: 
	@git submodule update --init --recursive
	@echo "All Vim plugins updated."

.PHONY: create_symlinks
create_symlinks: update_vim_plugins
	stow --adopt -t $(HOME) .
