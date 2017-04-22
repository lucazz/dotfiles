local ret_status="%(?:%{$fg_bold[green]%}●:%{$fg_bold[red]%}●)"

local username_command="%n"
local hostname_command="%m"
local username_output="%(!..$username_normal_color$username_command$reset@)"
local hostname_output="$hostname_color$hostname_command$reset"

PROMPT='${ret_status}$reset_color $username_output$hostname_output %{$fg[cyan]%}%c%{ $(git_prompt_info)$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}●"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"
