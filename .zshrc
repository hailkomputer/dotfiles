export EDITOR="nvim"

zmodload zsh/zprof

autoload -Uz compinit
compinit

alias ls='ls -la'
alias home='cd /Users/yigit'

# ===================
#    PLUGINS
# ===================
export NVM_LAZY_LOAD=true
export NVM_COMPLETION=true
source ~/.zsh-nvm/zsh-nvm.plugin.zsh

source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# ===================
#    THIRD PARTY
# ===================
if [ /usr/local/bin/kubectl ]; then source <(kubectl completion zsh); fi

export GOPATH="$HOME/go"
export GOROOT="/usr/local/opt/go/libexec"
export PATH="$PATH:$GOPATH/bin"
export PATH="$PATH:$GOROOT/bin"
export GPG_TTY=$(tty)

if [ -d "/usr/local/opt/ruby/bin" ]; then
    export PATH=/usr/local/opt/ruby/bin:$PATH
    export PATH=`gem environment gemdir`/bin:$PATH
fi

eval "$(starship init zsh)"

