set -g pure_check_for_new_release false
set -g pure_begin_prompt_with_current_directory true
set -g pure_enable_single_line_prompt false
set -g pure_enable_aws_profile false
set -g pure_enable_virtualenv false
set -g pure_show_numbered_git_indicator false
set -g pure_threshold_command_duration 3

set -g pure_color_current_directory blue
set -g pure_color_git_branch yellow
set -g pure_color_git_dirty yellow
set -g pure_color_command_duration brblack
set -g pure_color_prompt_on_success magenta
set -g pure_color_prompt_on_error red

# Keep window titles useful without Pure's redundant "- fish" suffix.
function fish_title --argument-names last_command
    set -l current_folder (fish_prompt_pwd_dir_length=$pure_shorten_window_title_current_directory_length prompt_pwd)

    if test -n "$last_command"
        echo "$current_folder: $last_command"
    else
        echo $current_folder
    end
end

# Pure needs a non-empty value here to preserve its adjacent Git segments.
# A colour reset has zero display width, so no stash glyph or gap is rendered.
function _pure_prompt_git_stash
    set_color normal
end

# Replaces Pure's version, which spawns git five times per prompt, with a
# single `git status` that reports branch, ahead/behind and dirtiness at once.
function _pure_prompt_git
    if set --query pure_enable_git; and test "$pure_enable_git" != true
        return
    end

    set --local git_status (command git status --porcelain=v2 --branch --ignore-submodules 2>/dev/null)
    or return

    set --local branch (string replace --filter '# branch.head ' '' -- $git_status)
    if test "$branch" = '(detached)'
        set branch (command git name-rev --name-only HEAD 2>/dev/null)
    end

    set --local git_prompt (_pure_set_color $pure_color_git_branch)$branch
    if string match --quiet --invert --regex '^# ' -- $git_status
        set --append git_prompt (_pure_set_color $pure_color_git_dirty)$pure_symbol_git_dirty
    end
    set git_prompt (string join '' -- $git_prompt (_pure_prompt_git_stash))

    set --local ahead_behind (string match --regex --groups-only '^# branch\.ab \+(\d+) -(\d+)$' -- $git_status)
    set --local pending
    if test -n "$ahead_behind[1]"; and test $ahead_behind[1] -gt 0
        set --append pending (_pure_set_color $pure_color_git_unpushed_commits)$pure_symbol_git_unpushed_commits
        test "$pure_show_numbered_git_indicator" = true; and set pending[-1] $pending[-1]$ahead_behind[1]
    end
    if test -n "$ahead_behind[2]"; and test $ahead_behind[2] -gt 0
        set --append pending (_pure_set_color $pure_color_git_unpulled_commits)$pure_symbol_git_unpulled_commits
        test "$pure_show_numbered_git_indicator" = true; and set pending[-1] $pending[-1]$ahead_behind[2]
    end
    if set --query pending[1]
        set --append git_prompt (string join '' -- $pending)
    end

    echo $git_prompt
end
