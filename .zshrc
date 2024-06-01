export EDITOR="nvim"

zmodload zsh/zprof

autoload -Uz compinit
compinit

alias ls='ls -la'
alias home="cd $HOME"
if [ -f ~/Gitea/.zshalias ]; then
    source ~/Gitea/.zshalias
fi
# ===================
#    PLUGINS
# ===================
if [[ $(uname) == "Darwin" ]]; then
    source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
    source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi
# ===================
#    THIRD PARTY
# ===================
if [ /usr/local/bin/kubectl ]; then source <(kubectl completion zsh); fi

export PATH="$PATH:$GOPATH/bin"
export PATH="$PATH:$GOROOT/bin"
if [ -d "$HOME/kcp/" ]; then
    export PATH="$PATH:$HOME/kcp"
fi

if [[ $(uname) == "Darwin" ]]; then
    if sysctl -n machdep.cpu.features | grep -qE '(VMX|SVM)'; then
    else
        export GPG_TTY=$(tty)
        export SSH_AUTH_SOCK=~/Library/Group\ Containers/2BUA8C4S2C.com.1password/t/agent.sock
    fi
fi

eval "$(starship init zsh)"

