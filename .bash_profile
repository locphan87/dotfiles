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
source ~/dotfiles/scripts/ps4
source ~/dotfiles/scripts/bash_completion
source ~/dotfiles/scripts/others
source ~/dotfiles/scripts/git_completion
source ~/.profile

# android SDK
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/platform-tools
# system PATH
export PATH=$PATH:/bin
export PATH=$PATH:/sbin
# user PATH
export PATH=$PATH:/usr/local/Cellar
export PATH=$PATH:/usr/local/bin
export PATH=$PATH:/usr/local/sbin
export PATH=$PATH:/usr/bin
export PATH=$PATH:/usr/sbin
# home PATH
export PATH=$HOME:$PATH
export PATH=$HOME/bin:$PATH
export PATH=$HOME/apps/maven/bin:$PATH
export PATH=$HOME/.fastlane/bin:$PATH
export PATH=$HOME/.yarn/bin:$PATH
export PATH=$HOME/.rvm/bin:$PATH
export PATH=$HOME/Library/PostgreSQL/9.5/bin:$PATH
