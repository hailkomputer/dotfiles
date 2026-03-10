all: install

install:
	mkdir -p ~/.config

	[ -f ~/.gitconfig ] || ln -s $(CURDIR)/.gitconfig ~/.gitconfig
	[ -f ~/.zshrc ] || ln -s $(CURDIR)/.zshrc ~/.zshrc
	[ -d ~/.config/nvim/ ] || ln -s $(CURDIR)/nvim ~/.config/nvim
	[ -d ~/.config/tmux/ ] || ln -s $(CURDIR)/tmux ~/.config/tmux
	[ -d ~/.config/bat/ ] || ln -s $(CURDIR)/bat ~/.config/bat
	[ -f ~/.config/starship.toml ] || ln -s $(CURDIR)/starship.toml ~/.config/starship.toml 

	touch ~/.hushlogin

clean:
	rm -f ~/.gitconfig
	rm -f ~/.zshrc
	rm -f ~/.hushlogin
	rm -f ~/.config/starship.toml
	rm -f ~/.config/nvim
	rm -f ~/.config/tmux
	rm -f ~/.config/bat

.PHONY: all clean install
