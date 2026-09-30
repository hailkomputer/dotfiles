# dotfiles

Personal dotfiles managed with symlinks via Make.

## What's Inside

| Tool | Config | Description |
| ------ | ------- | ------------- |
| **zsh** | `.zshrc` | Vi mode, history, fzf (Rose Pine via ANSI colors), autosuggestions |
| **git** | `.gitconfig` | Aliases, histogram diff, rerere, auto-setup remote |
| **neovim** | `nvim/` | LazyVim distribution with Rose Pine theme (follows light/dark) |
| **tmux** | `tmux/` | C-Space prefix, vi keys, TPM plugins, Rose Pine status bar (follows light/dark) |
| **starship** | `starship.toml` | Prompt, Rose Pine via ANSI colors |
| **bat** | `bat/` | Rose Pine / Rose Pine Dawn, follows terminal light/dark |
| **k9s** | `k9s/` | Rose Pine / Rose Pine Dawn skin, picked at launch |
| **claude code** | `claude/` | Rose Pine statusline, auto light/dark theme, settings |
| **ghostty** | `ghostty/` | Rose Pine / Rose Pine Dawn, follows system light/dark |

## Prerequisites

- [Homebrew](https://brew.sh) installed

## Installation

```sh
# clone the repo
git clone git@github.com:hailkomputer/dotfiles.git
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
├── k9s/                # k9s config + Rose Pine skins
├── ghostty/            # ghostty terminal config
├── claude/             # claude code statusline + settings
├── Brewfile            # homebrew dependencies
└── Makefile            # symlink installer
```
