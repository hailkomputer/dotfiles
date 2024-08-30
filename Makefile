all: install

install:
	mkdir -p ~/.config

	[ -f ~/.gitconfig ] || ln -s $(PWD)/.gitconfig ~/.gitconfig
	[ -f ~/.zshrc ] || ln -s $(PWD)/.zshrc ~/.zshrc
	[ -d ~/.config/nvim/ ] || ln -s $(PWD)/nvim ~/.config/nvim
	[ -d ~/.config/tmux/ ] || ln -s $(PWD)/tmux ~/.config/tmux
	[ -d ~/.config/wezterm/ ] || ln -s $(PWD)/wezterm ~/.config/wezterm
	[ -f ~/.config/starship.toml ] || ln -s $(PWD)/starship.toml ~/.config/starship.toml 

	touch ~/.hushlogin

clean:
	rm -f ~/.gitconfig
	rm -f ~/.zshrc
	rm -f ~/.zshenv
	rm -f ~/.hushlogin
	rm -f ~/.config/starship.toml
	rm -f ~/.config/nvim
	rm -f ~/.config/tmux
	rm -f ~/.config/wezterm

.PHONY: all clean install
