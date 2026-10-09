all: install

# file-level links: k9s writes clusters/, aliases.yaml etc. into this dir
K9S_DIR = $(HOME)/.config/k9s

install:
	mkdir -p ~/.config
	mkdir -p ~/.claude
	mkdir -p "$(K9S_DIR)/skins"

	[ -L ~/.gitconfig ] || [ -e ~/.gitconfig ] || ln -s $(CURDIR)/.gitconfig ~/.gitconfig
	[ -L ~/.zshrc ] || [ -e ~/.zshrc ] || ln -s $(CURDIR)/.zshrc ~/.zshrc
	[ -L ~/.config/nvim ] || [ -e ~/.config/nvim ] || ln -s $(CURDIR)/nvim ~/.config/nvim
	[ -L ~/.config/tmux ] || [ -e ~/.config/tmux ] || ln -s $(CURDIR)/tmux ~/.config/tmux
	[ -L ~/.config/bat ] || [ -e ~/.config/bat ] || ln -s $(CURDIR)/bat ~/.config/bat
	[ -L ~/.config/ghostty ] || [ -e ~/.config/ghostty ] || ln -s $(CURDIR)/ghostty ~/.config/ghostty
	[ -L ~/.config/starship.toml ] || [ -e ~/.config/starship.toml ] || ln -s $(CURDIR)/starship.toml ~/.config/starship.toml
	[ -L ~/.claude/statusline-command.sh ] || [ -e ~/.claude/statusline-command.sh ] || ln -s $(CURDIR)/claude/statusline-command.sh ~/.claude/statusline-command.sh
	[ -L ~/.claude/settings.json ] || [ -e ~/.claude/settings.json ] || ln -s $(CURDIR)/claude/settings.json ~/.claude/settings.json
	[ -L "$(K9S_DIR)/config.yaml" ] || [ -e "$(K9S_DIR)/config.yaml" ] || ln -s $(CURDIR)/k9s/config.yaml "$(K9S_DIR)/config.yaml"
	[ -L "$(K9S_DIR)/skins/rose-pine.yaml" ] || [ -e "$(K9S_DIR)/skins/rose-pine.yaml" ] || ln -s $(CURDIR)/k9s/skins/rose-pine.yaml "$(K9S_DIR)/skins/rose-pine.yaml"
	[ -L "$(K9S_DIR)/skins/rose-pine-dawn.yaml" ] || [ -e "$(K9S_DIR)/skins/rose-pine-dawn.yaml" ] || ln -s $(CURDIR)/k9s/skins/rose-pine-dawn.yaml "$(K9S_DIR)/skins/rose-pine-dawn.yaml"

# bat only sees the themes in bat/themes/ after a cache build
	if command -v bat >/dev/null 2>&1; then bat cache --build >/dev/null; fi
	touch ~/.hushlogin

# only remove links that point into this repo, never a real file or a foreign link
clean:
	[ "$$(readlink ~/.gitconfig)" != "$(CURDIR)/.gitconfig" ] || rm ~/.gitconfig
	[ "$$(readlink ~/.zshrc)" != "$(CURDIR)/.zshrc" ] || rm ~/.zshrc
	rm -f ~/.hushlogin
	[ "$$(readlink ~/.config/starship.toml)" != "$(CURDIR)/starship.toml" ] || rm ~/.config/starship.toml
	[ "$$(readlink ~/.config/nvim)" != "$(CURDIR)/nvim" ] || rm ~/.config/nvim
	[ "$$(readlink ~/.config/tmux)" != "$(CURDIR)/tmux" ] || rm ~/.config/tmux
	[ "$$(readlink ~/.config/bat)" != "$(CURDIR)/bat" ] || rm ~/.config/bat
	[ "$$(readlink ~/.config/ghostty)" != "$(CURDIR)/ghostty" ] || rm ~/.config/ghostty
	[ "$$(readlink ~/.claude/statusline-command.sh)" != "$(CURDIR)/claude/statusline-command.sh" ] || rm ~/.claude/statusline-command.sh
	[ "$$(readlink ~/.claude/settings.json)" != "$(CURDIR)/claude/settings.json" ] || rm ~/.claude/settings.json
	[ "$$(readlink "$(K9S_DIR)/config.yaml")" != "$(CURDIR)/k9s/config.yaml" ] || rm "$(K9S_DIR)/config.yaml"
	[ "$$(readlink "$(K9S_DIR)/skins/rose-pine.yaml")" != "$(CURDIR)/k9s/skins/rose-pine.yaml" ] || rm "$(K9S_DIR)/skins/rose-pine.yaml"
	[ "$$(readlink "$(K9S_DIR)/skins/rose-pine-dawn.yaml")" != "$(CURDIR)/k9s/skins/rose-pine-dawn.yaml" ] || rm "$(K9S_DIR)/skins/rose-pine-dawn.yaml"

.PHONY: all clean install
