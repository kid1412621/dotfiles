# dotfiles

Opinionated dotfiles with minimal setups. 

Target to support MacOS, Linux(e.g. Ubuntu on WSL, Fedora on bare metal, Debian on ChromeOS) under single branch.

Under the hoods, using [stow](https://www.gnu.org/software/stow/) to create symbolic links.

## Setups

### CLI & TUI

- **git**: **tig** + [lazygit](https://github.com/jesseduffield/lazygit)
  - [.gitconfig](./.gitconfig)
  - [.gitignore](./.gitignore)
  - [.tigrc](./.tigrc)
- **vim**: 
  - [.vimrc](./vimrc)
  - [.vim](./.vim/pack/plugins/start/) (native plugin via git submodule)
    - [nerdtree](https://github.com/preservim/nerdtree)
    - [easymotion](https://github.com/easymotion/vim-easymotion)
    - [surround](https://github.com/tpope/vim-surround)
    - [commentary](https://github.com/tpope/vim-commentary)
- neovim:
  - [.config/nvim](.config/nvim/) ([lazyvim](https://github.com/LazyVim/LazyVim))
- [**oh-my-zsh**](https://ohmyz.sh/) / [**oh-my-bash**](https://ohmybash.nntoan.com/)
    - [.zshrc](./.zshrc) / [.bashrc](./.bashrc)
- **tmux**: [.tmux.conf](./.tmux.conf)
- bat
- fd
- fzf
- ripgrep
- zoxide
- delta
- JetBrainsMonoNerdFont

> **Bold** means core apps, otherwise extra apps(mainly [rust-based CLI apps](https://github.com/sts10/rust-command-line-utilities) to boost the terminal experience).

### Lang-spicific bundles

- Java
- Python
- Node
- Container: Docker & K8S

### GUI

Currently only maintained MacOS GUI apps due via brew [bundle](https://github.com/Homebrew/homebrew-bundle). Default as follow(can chanage in [Brewfile](./Brewfile)):
- Swish
- Chrome
- Obsidian
- VS Code
- Android Studio
- Orbstack
- Postman
- Proxyman

## Usage

Make sure you installed `git` and `make`.

Then run:

```bash
git clone https://github.com/kid1412621/dotfiles.git && cd dotfiles && make
```

Optionally, just install core apps:

```bash
git clone https://github.com/kid1412621/dotfiles.git && cd dotfiles && make core
```

Or with GUI apps:

```bash
git clone https://github.com/kid1412621/dotfiles.git && cd dotfiles && make gui
```

And for specific lang related apps, e.g. java, which will install core packages:

```bash
git clone https://github.com/kid1412621/dotfiles.git && cd dotfiles && make java
```

For vim plugins update:

```bash
# actually it just run: git submodule update --init --recursive
make update_vim_plugins
```

> [!NOTE]
> 1. The install script only supports package manager: `brew`, `dnf` and `apt`. And make sure the user got install permission.
> 2. Replace `.ssh/config` with your own settings.

## Todo

- [x] ~~Finish all packages and configs.~~
- [x] ~~Distro-specific configs, like bat, fd under Ubuntu.~~
- [ ] ~~Replace `git submodules` with `git subtree`.~~
- [x] Dev env setups, e.g. NodeJS, Java, Python.
