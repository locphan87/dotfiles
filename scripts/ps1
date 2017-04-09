#!/bin/bash

parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
GIT_PS1_SHOWDIRTYSTATE=true
export PS1="\w\[\033[32m\]\$(parse_git_branch)\[\033[00m\]$ "
