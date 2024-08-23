# dotfiles

## Setups

### Packages

- git
- tig
- lazygit
- vim
- neovim
- bat
- tmux
- [oh-my-zsh](https://ohmyz.sh/)/[oh-my-bash](https://ohmybash.nntoan.com/)

### Configs

- .zshrc
- .bashrc
- .gitconfig
- .vim (navtive plugin via git submodule)
- .config/nvim (lazyvim)

## Usage

Just Run:

```bash
git clone https://github.com/kid1412621/dotfiles.git && dotfiles/install.sh
```

Under the hoods, using [stow](https://www.gnu.org/software/stow/) to create symbolic links.

> Note: The intall script only supports package manager: brew, dnf and apt. And make sure the user got install permission.
