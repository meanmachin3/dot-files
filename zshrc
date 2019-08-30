# gfa to get rid of deleted branches on origin and gbda to delete merged local branches.
alias gfa='git fetch --all --prune'
alias gbda='git branch --no-color --merged | command grep -vE "^(\*|\s*(master|develop|dev)\s*$)" | command xargs -n 1 git branch -d'

# Reload the shell
alias reload="exec ${SHELL} -l"

# Brew
alias bup="brew doctor && brew update && brew upgrade && brew cleanup && mas upgrade"
