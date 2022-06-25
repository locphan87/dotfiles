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
alias ls="ls -larth"
alias ..="cd .."
alias ..2="cd ../.."
alias ..3="cd ../../.."
alias ..4="cd ../../../.."
alias ..5="cd ../../../../.."
alias mux="tmuxinator"
alias gd="git-icdiff"
alias lc="colorls -lA --sd"
alias agrep="alias | grep"
alias code=~/bin/code

# Custom search engines
# https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/web-search
export ZSH_WEB_SEARCH_ENGINES=(
  imdb        "https://www.imdb.com/find?q="
  reddit      "https://www.reddit.com/search/?q="
  eshell      "https://explainshell.com/explain?cmd="
  trans-en    "https://translate.google.com/?hl=vi&tab=TT#view=home&op=translate&sl=en&tl=vi&text="
  trans-vi    "https://translate.google.com/?hl=vi&tab=TT#view=home&op=translate&sl=vi&tl=en&text="
  dict        "https://www.dictionary.com/browse/"
  thesaurus   "https://www.thesaurus.com/browse/"
  cambridge   "https://dictionary.cambridge.org/dictionary/english/"
  learnx      "https://learnxinyminutes.com/docs/"
  ramda       "https://ramdajs.com/docs/#"
  aws-site    "https://aws.amazon.com/"
  aws-docs    "https://docs.aws.amazon.com/"
  aws-console "https://console.aws.amazon.com/"
)

# Utilities
function mkdircd () { mkdir -p "$@" && eval cd "\"\$$#\""; }
function notif() {
  osascript -e "display notification \"$2\" with title \"$1\""
}
