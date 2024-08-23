# dotfiles

## Configs

- vim (plugin via git submodule)
- neovim (lazyvim)

## Usage

Just Run:
```bash
git clone https://github.com/kid1412621/dotfiles.git && dotfiles/install.sh
```

Under the hoods, using [stow](https://www.gnu.org/software/stow/) to create symbolic link.

> Note: The intall script only supports package manager: brew, dnf and apt.
