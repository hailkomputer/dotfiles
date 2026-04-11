# CLAUDE.md

This repository contains personal dotfiles managed via symlinks using Make.

## Structure

Each tool has its own directory or file at the repo root. The Makefile symlinks them to their expected locations.

| Source | Symlink target |
|--------|---------------|
| `.gitconfig` | `~/.gitconfig` |
| `.zshrc` | `~/.zshrc` |
| `nvim/` | `~/.config/nvim` |
| `tmux/` | `~/.config/tmux` |
| `bat/` | `~/.config/bat` |
| `starship.toml` | `~/.config/starship.toml` |
| `claude/statusline-command.sh` | `~/.claude/statusline-command.sh` |
| `claude/settings.json` | `~/.claude/settings.json` |
| `k9s/config.yaml` | `~/Library/Application Support/k9s/config.yaml` |
| `k9s/skins/catppuccin-mocha.yaml` | `~/Library/Application Support/k9s/skins/catppuccin-mocha.yaml` |

## Key conventions

- **Theme**: Catppuccin Mocha everywhere (neovim, tmux, starship, bat, fzf, claude statusline, k9s)
- **Shell**: zsh with vi mode, starship prompt, fzf, zsh-autosuggestions, zsh-syntax-highlighting
- **Editor**: neovim via LazyVim
- **Symlink guards**: Makefile uses `[ -L <path> ] || [ -e <path> ]` before linking — never overwrites existing files

## Makefile targets

- `make` / `make install` — create all symlinks and `~/.hushlogin`
- `make clean` — remove all managed symlinks

## Claude config notes

`~/.claude/` stores runtime data (sessions, cache, history) alongside config. Only specific files are symlinked — do not symlink the whole `~/.claude/` directory.

`claude/settings.json` enables the gopls LSP plugin and the Catppuccin Mocha statusline. The statusline command uses `~` so it resolves correctly on any machine.

## Stack

- Go development (GOPATH set, gopls plugin enabled in Claude Code)
- Kubernetes (kubectl alias `k`, krew, completion, k9s UI)
- macOS (Homebrew, Ghostty terminal)
