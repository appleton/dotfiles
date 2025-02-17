# Aliases

# Change directory
alias j='z' # Muscle memory
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

# Git
alias g='git'
compdef g=git
alias gst='git status'
compdef _git gst=git-status
alias gl='git pull'
compdef _git gl=git-pull
alias gup='git fetch && git rebase'
compdef _git gup=git-fetch
alias gp='git push'
compdef _git gp=git-push
gdv() { git diff -w "$@" | view - }
compdef _git gdv=git-diff
alias gc='git commit -v'
compdef _git gc=git-commit
alias gca='git commit -v -a'
compdef _git gca=git-commit
alias gco='git checkout'
compdef _git gco=git-checkout
alias gcm='git checkout master'
alias gb='git branch'
compdef _git gb=git-branch
alias gba='git branch -a'
compdef _git gba=git-branch
alias gcount='git shortlog -sn'
compdef gcount=git
alias gcp='git cherry-pick'
compdef _git gcp=git-cherry-pick
alias glg='git log --stat --max-count=5'
compdef _git glg=git-log
alias glgg='git log --graph --max-count=5'
compdef _git glgg=git-log
alias gss='git status -s'
compdef _git gss=git-status
alias ga='git add'
compdef _git ga=git-add
alias gm='git merge'
compdef _git gm=git-merge
alias grh='git reset HEAD'
alias grhh='git reset HEAD --hard'

# alias `gh` to `git open` only when called with no args, otherwise delegate to the Github CLI
function gh() {
  if [[ -z $1 ]] ; then
    command git open
  else
    command gh "$@"
  fi
}

#
# Will return the current branch name
# Usage example: git pull origin $(current_branch)
#
function current_branch() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo ${ref#refs/heads/}
}

# Static file server for current directory
function server {
  open http://localhost:8000
  python -m SimpleHTTPServer
}

# Open in Sublime Text
alias s='subl'
alias s.='subl .'

# Open in atom
alias a='atom'
alias a.='atom .'

# Open in vscode
alias c='code'
alias c.='code .'

# Bundler
alias b='bundle exec'

# rbenv
alias rb='rbenv'

# pngquant
alias pngdir='pngquant_dir'

# grep
alias grep="grep -i --color=auto"

alias nv="node -v"
alias nr="npm run"

function nu() {
  nvm use $(cat .node-version 2> /dev/null)
}

alias vim="/opt/homebrew/bin/nvim"
alias vi="nvim"
alias v='nvim'

alias h="heroku"

alias d="docker-compose run"
