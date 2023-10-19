export EDITOR="nvim"

zmodload zsh/zprof

autoload -Uz compinit
compinit

alias ls='ls -la'
alias home='cd /Users/yigit'

# ===================
#    PLUGINS
# ===================
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# ===================
#    THIRD PARTY
# ===================
if [ /usr/local/bin/kubectl ]; then source <(kubectl completion zsh); fi

#export GOPATH="$HOME/go"
#export GOROOT="/usr/local/opt/go/libexec"
export PATH="$PATH:$GOPATH/bin"
export PATH="$PATH:$GOROOT/bin"
export GPG_TTY=$(tty)

eval "$(starship init zsh)"

