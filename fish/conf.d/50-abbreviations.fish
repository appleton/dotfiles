status is-interactive; or return

# Directories
abbr --add --global .. 'cd ..'
abbr --add --global ... 'cd ../..'
abbr --add --global .... 'cd ../../..'
abbr --add --global ..... 'cd ../../../..'

# Git
abbr --add --global g git
abbr --add --global gst 'git status'
abbr --add --global gl 'git pull'
abbr --add --global gup 'git fetch; and git rebase'
abbr --add --global gp 'git push'
abbr --add --global gdv 'git diff --ignore-all-space'
abbr --add --global gc 'git commit --verbose'
abbr --add --global gca 'git commit --verbose --all'
abbr --add --global gco 'git switch'
abbr --add --global gcm 'git switch main'
abbr --add --global gba 'git branch --all'
abbr --add --global gcount 'git shortlog --summary --numbered'
abbr --add --global gcp 'git cherry-pick'
abbr --add --global glg 'git log --stat --max-count=5'
abbr --add --global glgg 'git log --graph --max-count=5'
abbr --add --global gss 'git status --short'
abbr --add --global ga 'git add'
abbr --add --global gm 'git merge'
abbr --add --global grh 'git reset HEAD'
abbr --add --global grhh 'git reset --hard HEAD'
abbr --add --global gopen 'gh browse'

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
