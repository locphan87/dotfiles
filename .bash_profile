# General settings
export CLICOLOR=1
export CDPATH=.
export NODE_OPTIONS=--max_old_space_size=8192 # 8GB

# Java
export JAVA_HOME="/usr/lib/jvm/java-8-openjdk-amd64/"
export PATH=$PATH:$JAVA_HOME/bin

# Android SDK
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/platform-tools

# Preferred editor for local and remote sessions
export EDITOR='vim'
set -o vi

if [[ "$(uname)" == "Linux" ]]; then
  setxkbmap -layout us -option
  setxkbmap -layout us -option caps:escape
fi

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
source $DOTFILES/config/shell/alias.sh

# Utilities
function mkdircd () { mkdir -p "$@" && eval cd "\"\$$#\""; }
