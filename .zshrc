if [[ "$OSTYPE" == "darwin"* ]]; then
  export PATH=/usr/local/bin:$PATH
  export PATH=$PATH:~/.o3-cli/bin
  export PATH=$PATH:$(go env GOPATH)/bin
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
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward


HISTSIZE=5000
HISTFILE=~/.zsh_history
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

# Aliases
alias ls='ls --color'
alias la='ls -a'
alias ll='ls -l'
alias lah='ls -lah'
alias nvim='nvim'
alias c='clear'

if [[ "$OSTYPE" == "darwin"* ]]; then
  # Запускает виртуальную машину для работы docker
  alias colimastart="colima start --profile ozon --dns 10.25.195.22 --dns 10.25.195.21 --dns 10.21.17.21 --dns 10.21.17.22 --cpu 2 --disk 60"
  # Останавливает виртуальную машину для docker
  alias colimastop="colima stop ozon"
fi

# Shell integrations
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"
