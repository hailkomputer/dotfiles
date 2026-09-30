# Homebrew: prepend bin + sbin ahead of /usr/bin (runs after macOS path_helper)
eval "$(/opt/homebrew/bin/brew shellenv)"

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

setopt EXTENDED_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_SAVE_NO_DUPS
setopt SHARE_HISTORY

alias ls='ls -la'
alias home="cd $HOME"
alias cat='bat'
alias k='kubectl'

# ===================
#    PLUGINS
# ===================
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source <(fzf --zsh)
# Rose Pine roles (rose-pine/fzf) on the terminal's ANSI colors, so the
# terminal's light/dark theme decides
export FZF_DEFAULT_OPTS=" \
--color=16 \
--color=fg:-1,bg:-1,hl:cyan \
--color=fg+:-1,bg+:black,hl+:cyan \
--color=border:bright-black,header:green,gutter:-1 \
--color=spinner:yellow,info:blue \
--color=pointer:magenta,marker:red,prompt:bright-black"

# ===================
#    THIRD PARTY
# ===================
if command -v kubectl &> /dev/null; then source <(kubectl completion zsh); fi

# same k9s config dir on macOS and linux
export K9S_CONFIG_DIR="$HOME/.config/k9s"
# k9s skins can't follow the terminal's light/dark theme live, so pick one at launch
k9s() {
  local skin=rose-pine
  if [[ -n $TMUX ]]; then
    [[ $(tmux display -p '#{client_theme}') == light ]] && skin=rose-pine-dawn
  elif [[ $OSTYPE == darwin* ]]; then
    [[ $(defaults read -g AppleInterfaceStyle 2>/dev/null) == Dark ]] || skin=rose-pine-dawn
  fi
  K9S_SKIN=$skin command k9s "$@"
}

export GOPATH="$HOME/go"
export GOROOT="$(go env GOROOT 2>/dev/null)"
export PATH="$PATH:$GOPATH/bin"
[ -n "$GOROOT" ] && export PATH="$PATH:$GOROOT/bin"
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

eval "$(starship init zsh)"

