# Setting up XDG base directories
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CACHE_HOME="$HOME/.cache"

# Ensure XDG directories exist
for dir in "$XDG_DATA_HOME" "$XDG_CONFIG_HOME" "$XDG_STATE_HOME" "$XDG_CACHE_HOME"; do
  [ ! -d "$dir" ] && mkdir -p "$dir"
done

# Export configuration to XDG directories
export DOCKER_CONFIG="$XDG_CONFIG_HOME/docker"
export GOPATH="$XDG_DATA_HOME/go"

# Platform-specific PATH setup
if [[ "$OSTYPE" == "darwin"* ]]; then
  export PATH="/usr/local/bin:$PATH"
  export PATH="$PATH:$HOME/.o3-cli/bin"
  export PATH="$PATH:$(go env GOPATH)/bin"
  export PATH="/usr/local/sbin:$PATH"
fi

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

# Zinit installation and setup
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

if [ ! -d "$ZINIT_HOME" ]; then
  mkdir -p "$(dirname $ZINIT_HOME)"
  git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

source "${ZINIT_HOME}/zinit.zsh"

# Adding zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# Adding zsh snippets
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::command-not-found
zinit snippet OMZP::golang

# Adding macOS specific snippets
if [[ "$OSTYPE" == "darwin"* ]]; then
  zinit snippet OMZP::brew
fi

# Creating directory for zcompdump if it doesn't exist
if [ ! -d "$XDG_CACHE_HOME/zsh" ]; then
  mkdir -p "$XDG_CACHE_HOME/zsh"
fi

# Loading completions
autoload -U compinit && compinit -d "$XDG_CACHE_HOME/zsh/zcompdump-$ZSH_VERSION"

# Replaying zinit cd command quietly
zinit cdreplay -q

# oh-my-posh setup for non-Apple Terminal
if [ "$TERM_PROGRAM" != "Apple_Terminal" ]; then
  eval "$(oh-my-posh init zsh --config $HOME/.config/ohmyposh/zen.toml)"
fi

# Key bindings
bindkey -e
bindkey '^[[A' up-line-or-search
bindkey '^[[B' down-line-or-search

# History settings
if [ ! -d "$XDG_STATE_HOME/zsh" ]; then
  mkdir -p "$XDG_STATE_HOME/zsh"
fi

HISTSIZE=5000
HISTFILE="$XDG_STATE_HOME/zsh/history"
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
zstyle ':completion:*' cache-path "$XDG_CACHE_HOME/zsh/zcompcache"

# Aliases
alias ls='ls --color'
alias la='ls -a'
alias ll='ls -la'
alias lah='ls -lah'
alias l.='ls -d .* --color=auto'
alias c='clear'
alias cd..='cd ..'
alias ..='cd ..'
alias ...='cd ../../../'
alias ....='cd ../../../../'
alias .....='cd ../../../../../'
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
alias svi='sudo vi'
alias vis='vim "+set si"'
alias ping='ping -c 5'
alias fastping='ping -c 100 -s.2'
alias mv='mv -i'
alias cp='cp -i'
alias ln='ln -i'
alias root='sudo -i'
alias su='sudo -i'

# macOS specific aliases
if [[ "$OSTYPE" == "darwin"* ]]; then
  alias colimastart="colima start --profile ozon --dns 10.25.195.22 --dns 10.25.195.21 --dns 10.21.17.21 --dns 10.21.17.22 --cpu 2 --disk 60"
  alias colimastop="colima stop ozon"
fi

# Shell integrations
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"
