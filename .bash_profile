# General settings
export CLICOLOR=1
export CDPATH=.

# Personal settings
export DOTFILES="$HOME/dotfiles"
export PATH="$HOME/homebrew/bin:$PATH"

# use ripgrep for fzf 
# https://github.com/BurntSushi/ripgrep
export FZF_CTRL_T_COMMAND="rg --files"

# NPM packages in homedir
export NPM_PACKAGES="$HOME/.npm-packages"
export PATH="$NPM_PACKAGES/bin:$PATH"
export NODE_OPTIONS=--max_old_space_size=4096 # 4GB
# Tell Node about these packages
export NODE_PATH="$NPM_PACKAGES/lib/node_modules:$NODE_PATH"

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

# Custom search engines
# https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/web-search
export ZSH_WEB_SEARCH_ENGINES=(
  reddit "https://www.reddit.com/search/?q="
  eshell "https://explainshell.com/explain?cmd="
)

# Utilities
function mkdircd () { mkdir -p "$@" && eval cd "\"\$$#\""; }
