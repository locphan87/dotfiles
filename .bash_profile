# General settings
export CLICOLOR=1
export CDPATH=.
export ANTHROPIC_MODEL=claude-opus-4-8

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
alias .1="cd .."
alias .2="cd ../.."
alias .3="cd ../../.."
alias agrep="alias | grep"

# Ask Claude a quick one-off question, e.g. `ask how do I undo a git commit`
function ask() { claude -p "$*"; }

function mkdircd() { mkdir -p "$@" && eval cd "\"\$$#\""; }
function stopwatch {
  start=$(date +%s)
  while true; do
    time="$(($(date +%s) - $start))"
    printf '%s\r' "$(date)"
    sleep 0.1
  done
}
function myquote {
  quote_file=$DOTFILES/quotes.txt
  # Retrieve a random quote
  sed -n $(awk "END{ print $RANDOM%NR+1}" $quote_file)p $quote_file
}
myquote
