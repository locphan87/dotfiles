export CLICOLOR=1
export GREP_COLOR=33
export LSCOLORS=ExFxBxDxCxegedabagacad
export EDITOR='vim'
export CDPATH=.

set -o vi

if [ "$(uname)" == "Linux" ]; then
  echo 'Use Linux profile'
  source ~/dotfiles/.profile_linux
elif [ "$(uname)" == "Darwin" ]; then
  echo 'Use MacOS profile'
  source ~/dotfiles/.profile_macos
fi

source ~/dotfiles/scripts/aliases
source ~/dotfiles/scripts/ps1
source ~/dotfiles/scripts/ps4
source ~/dotfiles/scripts/tmuxinator.bash
source ~/dotfiles/scripts/others
