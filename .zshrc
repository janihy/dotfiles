# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block, everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# zsh configuration
CASE_SENSITIVE="true"
UPDATE_ZSH_DAYS=31
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
HIST_STAMPS="yyyy-mm-dd"
# kitty integration
POWERLEVEL9K_TERM_SHELL_INTEGRATION=true

# ripgrep does not look for any particular config files unless we tell it to
RIPGREP_CONFIG_PATH=$HOME/.config/.ripgreprc
# automatically activate and deactivate .venv if found
PYTHON_AUTO_VRUN=true

function is-macos() {
  [[ $OSTYPE == darwin* ]]
}

if is-macos; then
  source /opt/homebrew/opt/antidote/share/antidote/antidote.zsh
else
  source ${ZDOTDIR:-~}/.antidote/antidote.zsh
fi

antidote load


if [[ $TERM_PROGRAM == "zed" ]]; then
  export TERM=xterm-256color
else
  export TERM=xterm-kitty
fi


# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='zed --wait'
fi

alias ls='ls -alh --color=auto'
alias mkdir='mkdir -pv'
alias cp='cp -iv'
alias mv='mv -iv'
# ssh doesn't (yet) allow us to override $TERM and xterm-kitty
# is not an option everywhere; this is ugly
alias ssh='TERM=xterm-256color ssh'

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

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export NVM_DIR="$HOME/.nvm"
export NVM_COMPLETION=true
export NVM_LAZY_LOAD=true
