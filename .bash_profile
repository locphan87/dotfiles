export CLICOLOR=1
export GREP_COLOR=33
export LSCOLORS=ExFxBxDxCxegedabagacad
export EDITOR='vim'
export CDPATH=.
export NPM_TOKEN='3df33b92-5de9-422f-b739-dbcc52219fcf'
export NEXUS_TOKEN='2abf4608-4059-349a-99d6-74bedf76812a'

set -o vi

# source ~/dotfiles/scripts/history_append
source ~/dotfiles/scripts/path
source ~/dotfiles/scripts/npm_completion
source ~/dotfiles/scripts/aliases
source ~/dotfiles/scripts/ps1
source ~/dotfiles/scripts/ps4
source ~/dotfiles/scripts/bash_completion
source ~/dotfiles/scripts/others
source ~/dotfiles/scripts/git_completion
source ~/.profile

. /Volumes/DATA/Users/loc.phan/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true
