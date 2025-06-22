export EDITOR="nvim"

autoload -Uz compinit
compinit

unsetopt flowcontrol
setopt auto_menu
setopt complete_in_word
setopt always_to_end
setopt auto_pushd

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

bindkey -v

##########
# HISTORY
##########

HISTFILE=$HOME/.zsh_history
HISTSIZE=50000
SAVEHIST=50000

setopt INC_APPEND_HISTORY
setopt EXTENDED_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_SAVE_NO_DUPS
setopt SHARE_HISTORY

alias ls='ls -la'
alias home="cd $HOME"
alias k='kubectl '

# ===================
#    PLUGINS
# ===================
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source <(fzf --zsh)

# ===================
#    THIRD PARTY
# ===================
if [ /usr/local/bin/kubectl ]; then source <(kubectl completion zsh); fi

export PATH="$PATH:$GOPATH/bin"
export PATH="$PATH:$GOROOT/bin"


eval "$(starship init zsh)"

