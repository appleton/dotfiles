status is-interactive; or return

# Directories
abbr --add --global .. 'cd ..'
abbr --add --global ... 'cd ../..'
abbr --add --global .... 'cd ../../..'
abbr --add --global ..... 'cd ../../../..'

# Git
abbr --add --global g git
abbr --add --global gst 'git status'
abbr --add --global gup 'git fetch; and git rebase'
abbr --add --global gp 'git push'
abbr --add --global gc 'git commit --verbose'
abbr --add --global gco 'git checkout'
abbr --add --global ga 'git add'

# Tools
abbr --add --global b 'bundle exec'
abbr --add --global c code
abbr --add --global c. 'code .'
abbr --add --global nr 'npm run'
abbr --add --global nv 'node --version'
abbr --add --global vim nvim
abbr --add --global vi nvim
abbr --add --global v nvim
abbr --add --global h heroku
abbr --add --global d 'docker compose run'
abbr --add --global grep 'grep -i --color=auto'
