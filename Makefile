.PHONY: all install_core_packages install_extra_packages update_vim_plugins create_symlinks create_symlinks_remain_old

all: install_core_packages install_extra_packages update_vim_plugins create_symlinks

core: install_core_packages update_vim_plugins create_symlinks

remain: install_core_packages install_extra_packages update_vim_plugins create_symlinks_remain_old

remain-core: install_core_packages update_vim_plugins create_symlinks_remain_old

install_core_packages:
	@echo "Installing core apps..."
	@./script/install.sh

install_extra_packages: install_core_packages
	@echo "Installing extra apps..."
	@./script/extra.sh

update_vim_plugins: 
	@git submodule update --init --recursive
	@echo "All Vim plugins updated."

create_symlinks_remain_old: update_vim_plugins
	stow --adopt -t $(HOME) .

create_symlinks: update_vim_plugins
	stow -t $(HOME) .
