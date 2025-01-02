export EDITOR="nvim"

zmodload zsh/zprof

autoload -Uz compinit
compinit

SAVEHIST=5000
HISTFILE=~/.zsh_history

setopt append_history
setopt hist_expire_dups_first
setopt hist_find_no_dups
setopt hist_ignore_all_dups
setopt share_history

alias ls='ls -la'
alias home="cd $HOME"
if [ -f ~/Gitlab/.zshalias ]; then
    source ~/Gitlab/.zshalias
fi
# ===================
#    PLUGINS
# ===================
if [[ $(uname) == "Darwin" ]]; then
    source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
    source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
    source <(fzf --zsh)
else
    source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
    source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
    source /usr/share/doc/fzf/examples/completion.zsh
    source /usr/share/doc/fzf/examples/key-bindings.zsh
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

bindkey -v

eval "$(starship init zsh)"

