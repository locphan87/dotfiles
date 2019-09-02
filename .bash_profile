echo '.bash_profile'

export CLICOLOR=1
export GREP_COLOR=33
export LSCOLORS=ExFxBxDxCxegedabagacad
export EDITOR='vim'
export CDPATH=.

set -o vi

if [ "$(uname)" == "Linux" ]; then
  source ~/dotfiles/.profile_linux
elif [ "$(uname)" == "Darwin" ]; then
  source ~/dotfiles/.profile_macos
fi

source ~/dotfiles/scripts/aliases
source ~/dotfiles/scripts/ps1
source ~/dotfiles/scripts/ps4
source ~/dotfiles/scripts/tmuxinator.bash
source ~/dotfiles/scripts/npm_completion
source ~/dotfiles/scripts/git_completion
source ~/dotfiles/scripts/others
