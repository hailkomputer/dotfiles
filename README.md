# dotfiles

Personal macOS dotfiles managed with symlinks via Make.

## What's Inside

| Tool | Config | Description |
|------|--------|-------------|
| **zsh** | `.zshrc` | Vi mode, history, fzf, autosuggestions, syntax highlighting |
| **git** | `.gitconfig` | Aliases, histogram diff, rerere, auto-setup remote |
| **neovim** | `nvim/` | LazyVim distribution with Catppuccin Mocha theme |
| **tmux** | `tmux/` | C-Space prefix, vi keys, TPM plugins, Catppuccin status bar |
| **starship** | `starship.toml` | Catppuccin Mocha prompt with kubernetes context |
| **bat** | `bat/` | Catppuccin Mocha theme |
| **ghostty** | (via Brewfile) | Terminal emulator |

## Prerequisites

- macOS with [Homebrew](https://brew.sh) installed
- Apple Silicon (`/opt/homebrew`)

## Installation

```sh
# clone the repo
git clone git@github.com:yigitdemirbas/dotfiles.git ~/Github/dotfiles
cd ~/Github/dotfiles

# install dependencies
brew bundle

# symlink configs to their expected locations
make
```

## Uninstall

```sh
make clean
```

## Structure

```
.
├── .gitconfig          # git configuration and aliases
├── .zshrc              # shell configuration
├── bat/                # bat theme config
├── nvim/               # neovim (LazyVim) configuration
│   └── lua/
│       ├── config/     # options, keymaps, autocmds
│       └── plugins/    # plugin overrides
├── starship.toml       # starship prompt config
├── tmux/               # tmux configuration + TPM plugins
├── Brewfile            # homebrew dependencies
└── Makefile            # symlink installer
```
