DEFAULT_USERNAME=andy
OTHER_USERNAME=aappleton

# Pure
# by Sindre Sorhus
# https://github.com/sindresorhus/pure
# MIT License


# For my own and others sanity
# git:
# %b => current branch
# %a => current action (rebase/merge)
# prompt:
# %F => color dict
# %f => reset color
# %~ => current path
# %* => time
# %n => username
# %m => shortname host
# %(?..) => prompt conditional - %(condition.true.false)



autoload -Uz add-zsh-hook
autoload -Uz vcs_info

add-zsh-hook precmd pure_precmd
add-zsh-hook preexec pure_preexec

zstyle ':vcs_info:*' enable git # You can add hg too if needed: `git hg`
zstyle ':vcs_info:git*' formats ' %b'
zstyle ':vcs_info:git*' actionformats ' %b|%a'

# enable prompt substitution
setopt local_options prompt_subst

# only show username if not default
[ $USER != "$DEFAULT_USERNAME" ] && [ $USER != "$OTHER_USERNAME" ] && local username='%n@%m '

# fastest possible way to check if repo is dirty
pure_git_dirty() {
  # check if we're in a git repo
  command git rev-parse --is-inside-work-tree &>/dev/null || return
  # check if it's dirty
  command git diff --quiet --ignore-submodules HEAD &>/dev/null; [ $? -eq 1 ] && echo '*'
}

# displays the exec time of the last command if set threshold was exceeded
pure_cmd_exec_time() {
  local stop=`date +%s`
  local start=${cmd_timestamp:-$stop}
  let local elapsed=$stop-$start
  [ $elapsed -gt "${PURE_CMD_MAX_EXEC_TIME:=5}" ] && echo ${elapsed}s
}

pure_preexec() {
  cmd_timestamp=`date +%s`
}

ruby_version() {
  local rvm_ruby=''

  if which rvm-prompt &> /dev/null; then
    rvm_ruby=$(rvm-prompt i v p g)
  else
    if which rbenv &> /dev/null; then
      rvm_ruby=$(rbenv version | sed -e "s/ (set.*$//")
    fi
  fi
  echo $rvm_ruby
}

pure_precmd() {
  local TERMWIDTH
  (( TERMWIDTH = ${COLUMNS} - 1 ))

  vcs_info
  # add `%*` to display the time
  print -P '\n%F{blue}%~%F{yellow}$vcs_info_msg_0_`pure_git_dirty` %F{black}`ruby_version` $username%f'
  # reset value since `preexec` isn't always triggered
  unset cmd_timestamp
}


# prompt turns red if the previous command didn't exit with 0
PROMPT='%(?.%F{magenta}.%F{red})❯%f '
RPROMPT=
# can be disabled:
# PROMPT='%F{magenta}❯%f '
