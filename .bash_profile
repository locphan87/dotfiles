export CLICOLOR=1
export GREP_COLOR=33
export LSCOLORS=ExFxBxDxCxegedabagacad
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_20.jdk/Contents/Home
export EDITOR='vim'
export CDPATH=$HOME

set -o vi

# source ~/dotfiles/scripts/history_append
source ~/dotfiles/scripts/npm_completion
source ~/dotfiles/scripts/aliases
source ~/dotfiles/scripts/ps1
source ~/dotfiles/scripts/bash_completion
source ~/dotfiles/scripts/others
source ~/dotfiles/scripts/git_completion
source ~/.profile

# Android SDK
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/platform-tools
# Update PATH
export PATH=$PATH:/usr/local/sbin:/usr/local/Cellar:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$HOME/bin:$HOME/apps/maven/bin:$HOME:$HOME/.rvm/bin:/Library/PostgreSQL/9.5/bin:$HOME/.yarn/bin
export PATH="$HOME/.fastlane/bin:$PATH"
