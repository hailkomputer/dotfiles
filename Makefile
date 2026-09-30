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

clean:
	rm -f ~/.gitconfig
	rm -f ~/.zshrc
	rm -f ~/.hushlogin
	rm -f ~/.config/starship.toml
	rm -f ~/.config/nvim
	rm -f ~/.config/tmux
	rm -f ~/.config/bat
	rm -f ~/.config/ghostty
	rm -f ~/.claude/statusline-command.sh
	rm -f ~/.claude/settings.json
	rm -f "$(K9S_DIR)/config.yaml"
	rm -f "$(K9S_DIR)/skins/rose-pine.yaml"
	rm -f "$(K9S_DIR)/skins/rose-pine-dawn.yaml"

.PHONY: all clean install
