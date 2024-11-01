# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export TERM=xterm-kitty

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block, everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=31

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  colored-man-pages
  colorize
  command-not-found
  direnv
  extract
  git
  gpg-agent
  nvm
  pass
  pip
  taskwarrior
  thefuck
  )

export ZSH_AUTOSUGGEST_STRATEGY=(history)

source $ZSH/oh-my-zsh.sh

# User configuration

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='subl -n -w'
fi

alias ls='ls -alh --color=auto'
alias mkdir='mkdir -pv'
alias cp='cp -iv'
alias mv='mv -iv'
# ssh doesn't (yet) allow us to override $TERM and xterm-kitty
# is not an option everywhere
alias ssh='TERM=xterm-256color ssh'

# ctrl+space to accept autosuggestions
bindkey '^@' autosuggest-accept

# use ctrl+arrows to move on the shell
bindkey "^[Od" backward-word
bindkey "^[Oc" forward-word

# use ctrl+backspace and ctrl+delete to kill words
bindkey '^H' backward-kill-word
bindkey "\e[3^": kill-word

if [[ -f ~/.zshrc.local ]]; then
  source ~/.zshrc.local
fi

export RIPGREP_CONFIG_PATH=$HOME/.config/.ripgreprc
export POWERLEVEL9K_TERM_SHELL_INTEGRATION=true

export ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# source antidote
# one should use $OSTYPE instead but let's refactor later
if [[ $(uname) == "Darwin" ]]; then
  source /opt/homebrew/opt/antidote/share/antidote/antidote.zsh
else
  source ${ZDOTDIR:-~}/.antidote/antidote.zsh
fi

# initialize plugins statically with ${ZDOTDIR:-~}/.zsh_plugins.txt
antidote load
