# dotfiles

Opinionated dotfiles with minimal setups. 

Target to support MacOS, Linux(e.g. Ubuntu on WSL, Fedora, Debian on ChromeOS) under single branch.

Under the hoods, using [stow](https://www.gnu.org/software/stow/) to create symbolic links.

## Setups

- **git**: tig + lazygit
  - [.gitconfig](./.gitconfig)
  - [.tigrc](./.tigrc)
- **vim**: neovim + lazyvim
  - [.vim](.vim) (native plugin via git submodule)
  - [.config/nvim](.config/nvim/) (lazyvim)
- [**oh-my-zsh**](https://ohmyz.sh/) / [**oh-my-bash**](https://ohmybash.nntoan.com/)
    - [.zshrc](./.zshrc) / [.bashrc](./.bashrc)
- **tmux**: [.tmux.conf](./.tmux.conf)
- bat
- fd
- fzf
- ripgrep
- zoxide
- delta
- lazydocker
- JetBrainsMonoNerdFont

> **Bold** means core apps, otherwise extra apps(mainly [rust-based CLI apps](https://github.com/sts10/rust-command-line-utilities) to enhance the terminal experience).

## Usage

Make sure you installed `git` and `make`.

Then run:

```bash
git clone --recursive https://github.com/kid1412621/dotfiles.git && cd dotfiles && make
```

Optionally, just install core apps:

```bash
git clone --recursive https://github.com/kid1412621/dotfiles.git && cd dotfiles && make core
```

For vim plugins update:
```
git submodule update --init --recursive
```

> > [!NOTE]
> 1. The install script only supports package manager: brew, dnf and apt. And make sure the user got install permission.
> 2. Replace `.ssh/config` with your own settings.

## Todo:

- [x] ~~Finish all packages and configs.~~
- [x] ~~Distro-specific configs, like bat, fd under Ubuntu.~~
- [ ] ~~Replace `git submodules` with `git subtree`.~~
- [ ] Dev env setups, e.g. NodeJS, Java, Python.
