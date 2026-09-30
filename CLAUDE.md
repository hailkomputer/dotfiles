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
| `ghostty/` | `~/.config/ghostty` |
| `starship.toml` | `~/.config/starship.toml` |
| `claude/statusline-command.sh` | `~/.claude/statusline-command.sh` |
| `claude/settings.json` | `~/.claude/settings.json` |
| `k9s/config.yaml` | `~/.config/k9s/config.yaml` (`K9S_CONFIG_DIR`, set in `.zshrc`) |
| `k9s/skins/rose-pine*.yaml` | `~/.config/k9s/skins/` |

## Key conventions

- **Theme**: Rose Pine (dark) / Rose Pine Dawn (light) everywhere, following the terminal's light/dark theme. Ghostty switches with the OS appearance and the rest follow the terminal:
  - neovim: `variant = "auto"` (nvim updates `background` from the terminal)
  - bat: `--theme=auto`; `make install` runs `bat cache --build`, rerun it after changing `bat/themes/`
  - tmux: `client-dark-theme` / `client-light-theme` hooks set `@rose_pine_variant` and re-run the plugin
  - starship, fzf, claude statusline: ANSI colors only, so the terminal palette decides — no hex values
  - k9s: converts every color to RGB, so the `k9s()` function in `.zshrc` picks the skin via `K9S_SKIN` at launch
  - claude code: `"theme": "auto"`
- **Shell**: zsh with vi mode, starship prompt, fzf, zsh-autosuggestions, zsh-syntax-highlighting
- **Editor**: neovim via LazyVim
- **Symlink guards**: Makefile uses `[ -L <path> ] || [ -e <path> ]` before linking — never overwrites existing files

## Makefile targets

- `make` / `make install` — create all symlinks and `~/.hushlogin`, build bat's theme cache
- `make clean` — remove all managed symlinks

## Claude config notes

`~/.claude/` stores runtime data (sessions, cache, history) alongside config. Only specific files are symlinked — do not symlink the whole `~/.claude/` directory.

`claude/settings.json` enables the gopls LSP plugin, the Rose Pine statusline, and `"theme": "auto"` (match terminal light/dark). The statusline command uses `~` so it resolves correctly on any machine.

## Stack

- Go development (GOPATH set, gopls plugin enabled in Claude Code)
- Kubernetes (kubectl alias `k`, krew, completion, k9s UI)
- macOS (Homebrew, Ghostty terminal)
