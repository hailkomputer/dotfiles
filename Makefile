all: install

install:
	mkdir -p ~/.config
	mkdir -p ~/.claude

	[ -L ~/.gitconfig ] || [ -e ~/.gitconfig ] || ln -s $(CURDIR)/.gitconfig ~/.gitconfig
	[ -L ~/.zshrc ] || [ -e ~/.zshrc ] || ln -s $(CURDIR)/.zshrc ~/.zshrc
	[ -L ~/.config/nvim ] || [ -e ~/.config/nvim ] || ln -s $(CURDIR)/nvim ~/.config/nvim
	[ -L ~/.config/tmux ] || [ -e ~/.config/tmux ] || ln -s $(CURDIR)/tmux ~/.config/tmux
	[ -L ~/.config/bat ] || [ -e ~/.config/bat ] || ln -s $(CURDIR)/bat ~/.config/bat
	[ -L ~/.config/starship.toml ] || [ -e ~/.config/starship.toml ] || ln -s $(CURDIR)/starship.toml ~/.config/starship.toml
	[ -L ~/.claude/statusline-command.sh ] || [ -e ~/.claude/statusline-command.sh ] || ln -s $(CURDIR)/claude/statusline-command.sh ~/.claude/statusline-command.sh
	[ -L ~/.claude/settings.json ] || [ -e ~/.claude/settings.json ] || ln -s $(CURDIR)/claude/settings.json ~/.claude/settings.json

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

.PHONY: all clean install
