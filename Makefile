all: install

K9S_DIR = $(HOME)/Library/Application Support/k9s

install:
	mkdir -p ~/.config
	mkdir -p ~/.claude
	mkdir -p "$(K9S_DIR)/skins"

	[ -L ~/.gitconfig ] || [ -e ~/.gitconfig ] || ln -s $(CURDIR)/.gitconfig ~/.gitconfig
	[ -L ~/.zshrc ] || [ -e ~/.zshrc ] || ln -s $(CURDIR)/.zshrc ~/.zshrc
	[ -L ~/.config/nvim ] || [ -e ~/.config/nvim ] || ln -s $(CURDIR)/nvim ~/.config/nvim
	[ -L ~/.config/tmux ] || [ -e ~/.config/tmux ] || ln -s $(CURDIR)/tmux ~/.config/tmux
	[ -L ~/.config/bat ] || [ -e ~/.config/bat ] || ln -s $(CURDIR)/bat ~/.config/bat
	[ -L ~/.config/starship.toml ] || [ -e ~/.config/starship.toml ] || ln -s $(CURDIR)/starship.toml ~/.config/starship.toml
	[ -L ~/.claude/statusline-command.sh ] || [ -e ~/.claude/statusline-command.sh ] || ln -s $(CURDIR)/claude/statusline-command.sh ~/.claude/statusline-command.sh
	[ -L ~/.claude/settings.json ] || [ -e ~/.claude/settings.json ] || ln -s $(CURDIR)/claude/settings.json ~/.claude/settings.json
	[ -L ~/.aerospace.toml ] || [ -e ~/.aerospace.toml ] || ln -s $(CURDIR)/aerospace.toml ~/.aerospace.toml
	[ -L "$(K9S_DIR)/config.yaml" ] || [ -e "$(K9S_DIR)/config.yaml" ] || ln -s $(CURDIR)/k9s/config.yaml "$(K9S_DIR)/config.yaml"
	[ -L "$(K9S_DIR)/skins/catppuccin-mocha.yaml" ] || [ -e "$(K9S_DIR)/skins/catppuccin-mocha.yaml" ] || ln -s $(CURDIR)/k9s/skins/catppuccin-mocha.yaml "$(K9S_DIR)/skins/catppuccin-mocha.yaml"

	touch ~/.hushlogin

clean:
	rm -f ~/.gitconfig
	rm -f ~/.zshrc
	rm -f ~/.hushlogin
	rm -f ~/.config/starship.toml
	rm -f ~/.config/nvim
	rm -f ~/.config/tmux
	rm -f ~/.config/bat
	rm -f ~/.claude/statusline-command.sh
	rm -f ~/.claude/settings.json
	rm -f ~/.aerospace.toml
	rm -f "$(K9S_DIR)/config.yaml"
	rm -f "$(K9S_DIR)/skins/catppuccin-mocha.yaml"

.PHONY: all clean install
