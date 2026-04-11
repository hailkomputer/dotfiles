# dotfiles

Personal dotfiles managed with symlinks via Make.

## What's Inside

| Tool | Config | Description |
| ------ | ------- | ------------- |
| **zsh** | `.zshrc` | Vi mode, history, fzf, autosuggestions |
| **git** | `.gitconfig` | Aliases, histogram diff, rerere, auto-setup remote |
| **neovim** | `nvim/` | LazyVim distribution with Catppuccin Mocha theme |
| **tmux** | `tmux/` | C-Space prefix, vi keys, TPM plugins, Status bar |
| **starship** | `starship.toml` | Prompt |
| **bat** | `bat/` | Catppuccin Mocha theme |
| **k9s** | `k9s/` | Catppuccin Mocha skin |
| **claude code** | `claude/` | Catppuccin Mocha statusline, settings |
| **ghostty** | (via Brewfile) | Terminal emulator |

## Prerequisites

- [Homebrew](https://brew.sh) installed

## Installation

```sh
# clone the repo
git clone git@github.com:yigitdemirbas/dotfiles.git
cd dotfiles

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

```markdown
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
├── k9s/                # k9s config + Catppuccin Mocha skin
├── claude/             # claude code statusline + settings
├── Brewfile            # homebrew dependencies
└── Makefile            # symlink installer
```
