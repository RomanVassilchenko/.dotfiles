if [[ "$OSTYPE" == "darwin"* ]]; then
  export PATH=/usr/local/bin:$PATH
  export PATH=$PATH:~/.o3-cli/bin
  export PATH=$PATH:$(go env GOPATH)/bin
  export PATH="/usr/local/sbin:$PATH"
  export PATH="/Users/rovasilchenko/.config/emacs/bin:$PATH"
fi

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
  # Evaluate Homebrew environment
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
  export PATH="$PATH:/home/rovassilchenko/.local/share/JetBrains/Toolbox/scripts"
fi

export GOPATH=$HOME/go
export PATH="$HOME/.go/bin:$PATH"

export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CACHE_HOME="$HOME/.cache"

ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

if [ ! -d "$ZINIT_HOME" ]; then
	mkdir -p "$(dirname $ZINIT_HOME)"
	git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

source "${ZINIT_HOME}/zinit.zsh"

export INPUTRC="$XDG_CONFIG_HOME"/readline/inputrc
export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc

# Add in zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# Add in snippets
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::command-not-found
zinit snippet OMZP::golang

if [[ "$OSTYPE" == "darwin"* ]]; then
  zinit snippet OMZP::brew
fi

# Load completions
autoload -U compinit && compinit

zinit cdreplay -q

if [ "$TERM_PROGRAM" != "Apple_Terminal" ]; then
  eval "$(oh-my-posh init zsh --config $HOME/.config/ohmyposh/zen.toml)"
fi

bindkey -e
#bindkey '^p' history-search-backward
#bindkey '^n' history-search-forward
#bindkey '^[[A' history-incremental-search-backward
#bindkey '^[[B' history-incremental-search-forward
bindkey '^[[A' up-line-or-search
bindkey '^[[B' down-line-or-search


HISTSIZE=5000
HISTFILE="$XDG_STATE_HOME"/zsh/history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

zstyle ':completion:*' cache-path "$XDG_CACHE_HOME"/zsh/zcompcache

# Aliases
alias ls='ls --color'
alias la='ls -a'
alias ll='ls -la'
alias lah='ls -lah'
alias l.='ls -d .* --color=auto'

alias nvim='nvim'
alias c='clear'

alias cd..='cd ..'
alias ..='cd ..'
alias ...='cd ../../../'
alias ....='cd ../../../../'
alias .....='cd ../../../../'
alias .4='cd ../../../../'
alias .5='cd ../../../../..'

alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

alias mkdir='mkdir -pv'

alias diff='colordiff'

alias h='history'
alias j='jobs -l'

alias path='echo -e ${PATH//:/\\n}'
alias now='date +"%T"'
alias nowtime=now
alias nowdate='date +"%d-%m-%Y"'

alias vi=nvim
alias svi='sudo vi'
alias vis='vim "+set si"'
alias edit='nvim'

alias ping='ping -c 5'
alias fastping='ping -c 100 -s.2'

alias mv='mv -i'
alias cp='cp -i'
alias ln='ln -i'

alias root='sudo -i'
alias su='sudo -i'

if [[ "$OSTYPE" == "darwin"* ]]; then
  # Запускает виртуальную машину для работы docker
  alias colimastart="colima start --profile ozon --dns 10.25.195.22 --dns 10.25.195.21 --dns 10.21.17.21 --dns 10.21.17.22 --cpu 2 --disk 60"
  # Останавливает виртуальную машину для docker
  alias colimastop="colima stop ozon"
fi

# Shell integrations
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"
