export EDITOR="nvim"

zmodload zsh/zprof

autoload -Uz compinit
compinit

alias ls='ls -la'
alias home='cd /Users/yigit'
if [ -f ~/Gitea/.zshalias ]; then
    source ~/Gitea/.zshalias
else
    print "failed to source gitea aliases"
fi
# ===================
#    PLUGINS
# ===================
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# ===================
#    THIRD PARTY
# ===================
if [ /usr/local/bin/kubectl ]; then source <(kubectl completion zsh); fi

export PATH="$PATH:$GOPATH/bin"
export PATH="$PATH:$GOROOT/bin"
export GPG_TTY=$(tty)
export SSH_AUTH_SOCK=~/Library/Group\ Containers/2BUA8C4S2C.com.1password/t/agent.sock

eval "$(starship init zsh)"

