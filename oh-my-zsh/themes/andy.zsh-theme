# Andrew Appleton's ZSH theme
# http://appleton.me

local current_dir='%~%'
local git_branch='$(git_prompt_info)%{$reset_color%}'
local rvm_ruby=''

if which rvm-prompt &> /dev/null; then
  rvm_ruby='rvm:%{$fg[red]%}($(rvm-prompt i v p g))%{$reset_color%}'
else
  if which rbenv &> /dev/null; then
    rvm_ruby='rbenv:%{$fg[red]%}$(rbenv version | sed -e "s/ (set.*$//")%{$reset_color%}'
  fi
fi

PROMPT="%{$fg[white]%} ${current_dir}  : %{$reset_color%}"
RPROMPT="${git_branch} ${rvm_ruby}"

ZSH_THEME_GIT_PROMPT_PREFIX="git:%{$fg[yellow]%}("
ZSH_THEME_GIT_PROMPT_SUFFIX=")%{$reset_color%}"
