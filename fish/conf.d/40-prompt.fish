# Keep the actual Pure prompt close to the restrained Zsh setup.
set -g pure_check_for_new_release false
set -g pure_begin_prompt_with_current_directory true
set -g pure_enable_single_line_prompt false
set -g pure_enable_aws_profile false
set -g pure_enable_virtualenv false
set -g pure_threshold_command_duration 3

set -g pure_color_current_directory blue
set -g pure_color_git_branch yellow
set -g pure_color_git_dirty yellow
set -g pure_color_command_duration brblack
set -g pure_color_prompt_on_success magenta
set -g pure_color_prompt_on_error red

# Pure needs a non-empty value here to preserve its adjacent Git segments.
# A colour reset has zero display width, so no stash glyph or gap is rendered.
function _pure_prompt_git_stash
    set_color normal
end
