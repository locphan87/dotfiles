# General settings
export CLICOLOR=1
export CDPATH=.

# use ripgrep for fzf
# https://github.com/BurntSushi/ripgrep
export FZF_DEFAULT_COMMAND="rg --files --smart-case"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# Preferred editor for local and remote sessions
export EDITOR='nvim'
set -o vi

# Aliases
alias zshrc="vim ~/.zshrc"
alias vimrc="vim ~/.vimrc"
alias chrome="open -a 'Google Chrome'"
alias fp="fzf --preview 'bat --style=numbers --color=always --line-range :500 {}'"
alias ls="colorls -larth"
alias .1="cd .."
alias .2="cd ../.."
alias .3="cd ../../.."
alias mux="tmuxinator"
alias agrep="alias | grep"
alias code=~/bin/code
alias python=python3
alias vim=nvim
alias b='buku --suggest'
alias bs="b --oa --np -s"

function mkdircd () { mkdir -p "$@" && eval cd "\"\$$#\""; }
