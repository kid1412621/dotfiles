# dotfiles

## Setups

- **git**: tig + lazygit
  - .gitconfig
  - .tig
- **vim**: neovim + lazyvim
  - [.vim](.vim) (navtive plugin via git submodule)
  - [.config/nvim](.config/nvim/) (lazyvim)
- [oh-my-zsh](https://ohmyz.sh/) / [oh-my-bash](https://ohmybash.nntoan.com/)
    - .zshrc / .bashrc
- **tmux**
- bat
- fd
- fzf
- ripgrep

> **Bold** means core apps, otherwise extra apps.

## Usage

Make sure you installed `git` and `make`.

Then run:

```bash
git clone https://github.com/kid1412621/dotfiles.git && cd dotfiles.git && make
```

Optionally, just install core apps:

```bash
git clone https://github.com/kid1412621/dotfiles.git && cd dotfiles.git && make core
```

Under the hoods, using [stow](https://www.gnu.org/software/stow/) to create symbolic links.

> > [!NOTE]
> 1. The intall script only supports package manager: brew, dnf and apt. And make sure the user got install permission.
> 2. Replace `.ssh/config` with your own settings.

## Todo:

- [ ] Fisnish all packages and configs.
- [ ] Distro-specific configs, like bat, fd under Ubuntu.
- [ ] Replace `git submodules` with `git subtree`.
