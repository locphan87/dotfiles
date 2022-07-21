# General settings
export CLICOLOR=1
export CDPATH=.

# Personal settings
export DOTFILES="$HOME/dotfiles"

# use ripgrep for fzf
# https://github.com/BurntSushi/ripgrep
export FZF_DEFAULT_COMMAND="rg --files --smart-case"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# Preferred editor for local and remote sessions
export EDITOR='vim'
set -o vi

# Aliases
alias zshrc="vim ~/.zshrc"
alias vimrc="vim ~/.vimrc"
alias chrome="open -a 'Google Chrome'"
alias ls="colorls -larth"
alias .1="cd .."
alias .2="cd ../.."
alias .3="cd ../../.."
alias mux="tmuxinator"
alias agrep="alias | grep"
alias code=~/bin/code

function mkdircd () { mkdir -p "$@" && eval cd "\"\$$#\""; }
function notif() {
  osascript -e "display notification \"$2\" with title \"$1\""
}
function project() {
  echo "Starting $1"
  project="$HOME/projects/$1"
  cd $project
  vim
}
