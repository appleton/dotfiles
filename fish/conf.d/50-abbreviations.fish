status is-interactive; or return

# Each abbreviation also gets a function of the same name (unless a command
# already exists): fish only autosuggests history entries whose command
# exists, so without one `gp --force-with-lease` would never be suggested.
function _abbr --argument-names name expansion
    abbr --add --global $name $expansion
    type -q -- $name; and return
    function $name --inherit-variable expansion --wraps $expansion
        eval $expansion (string escape -- $argv)
    end
end

# Directories
abbr --add --global .. 'cd ..'
abbr --add --global ... 'cd ../..'
abbr --add --global .... 'cd ../../..'
abbr --add --global ..... 'cd ../../../..'

# Git
_abbr g git
_abbr gst 'git status'
_abbr gup 'git fetch; and git rebase'
_abbr gp 'git push'
_abbr gc 'git commit --verbose'
_abbr gco 'git checkout'
_abbr ga 'git add'

# Tools
_abbr b 'bundle exec'
_abbr c code
_abbr c. 'code .'
_abbr nr 'npm run'
_abbr nv 'node --version'
_abbr vim nvim
_abbr vi nvim
_abbr v nvim
_abbr h heroku
_abbr d 'docker compose run'
_abbr grep 'grep -i --color=auto'

functions --erase _abbr
