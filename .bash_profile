# General settings
export CLICOLOR=1
export CDPATH=.

# Preferred editor for local and remote sessions
export EDITOR='vim'
set -o vi

# Aliases
alias zshrc="vim ~/.zshrc"
alias vimrc="vim ~/.vimrc"
alias fp="fzf --preview 'bat --style=numbers --color=always --line-range :500 {}'"
alias ls="ls -larth"
alias .1="cd .."
alias .2="cd ../.."
alias .3="cd ../../.."
alias agrep="alias | grep"
alias python=python3

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
