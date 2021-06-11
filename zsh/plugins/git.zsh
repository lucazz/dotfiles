autoload -U colors && colors
: "${ZSH_GIT_PROMPT_SHOW_UPSTREAM=""}"
: "${ZSH_GIT_PROMPT_SHOW_STASH=""}"
: "${ZSH_GIT_PROMPT_ENABLE_SECONDARY=""}"
: "${ZSH_GIT_PROMPT_NO_ASYNC=""}"
: "${ZSH_GIT_PROMPT_FORCE_BLANK=""}"
: "${ZSH_GIT_PROMPT_AWK_CMD=""}"
: "${ZSH_THEME_GIT_PROMPT_PREFIX=""}"
: "${ZSH_THEME_GIT_PROMPT_SUFFIX=" "}"
: "${ZSH_THEME_GIT_PROMPT_SEPARATOR="|"}"
: "${ZSH_THEME_GIT_PROMPT_DETACHED="%{$fg_bold[cyan]%}:"}"
: "${ZSH_THEME_GIT_PROMPT_BRANCH=" %{$fg_bold[green]%}"}"
: "${ZSH_THEME_GIT_PROMPT_UPSTREAM_SYMBOL="%{$fg_bold[yellow]%}⟳ "}"
: "${ZSH_THEME_GIT_PROMPT_UPSTREAM_PREFIX="%{$fg[red]%}(%{$fg[yellow]%}"}"
: "${ZSH_THEME_GIT_PROMPT_UPSTREAM_SUFFIX="%{$fg[red]%})"}"
: "${ZSH_THEME_GIT_PROMPT_BEHIND="↓"}"
: "${ZSH_THEME_GIT_PROMPT_AHEAD="↑"}"
: "${ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[red]%}✖"}"
: "${ZSH_THEME_GIT_PROMPT_STAGED="%{$fg[green]%}●"}"
: "${ZSH_THEME_GIT_PROMPT_UNSTAGED="%{$fg[red]%}✚"}"
: "${ZSH_THEME_GIT_PROMPT_UNTRACKED="…"}"
: "${ZSH_THEME_GIT_PROMPT_STASHED="%{$fg[blue]%}⚑"}"
: "${ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg_bold[green]%}"}"
: "${ZSH_THEME_GIT_PROMPT_SECONDARY_PREFIX=""}"
: "${ZSH_THEME_GIT_PROMPT_SECONDARY_SUFFIX=""}"
: "${ZSH_THEME_GIT_PROMPT_TAGS_SEPARATOR=", "}"
: "${ZSH_THEME_GIT_PROMPT_TAGS_PREFIX="🏷 "}"
: "${ZSH_THEME_GIT_PROMPT_TAGS_SUFFIX=""}"
: "${ZSH_THEME_GIT_PROMPT_TAG="%{$fg_bold[magenta]%}"}"

# Disable promptinit if it is loaded
(( $+functions[promptinit] )) && {promptinit; prompt off}

# Allow parameter and command substitution in the prompt
setopt PROMPT_SUBST

# Override PROMPT if it does not use the gitprompt function
[[ "$PROMPT" != *gitprompt* && "$RPROMPT" != *gitprompt* ]] \
		&& PROMPT='%B%40<..<%1~ %b$(gitprompt)' \
		&& PROMPT+='%(?.%(!.%F{white}❯%F{yellow}❯%F{red}.%F{blue}❯%F{cyan}❯%F{green})❯.%F{red}❯❯❯)%f '

# Find an awk implementation
# Prefer nawk over mawk and mawk over awk
(( $+commands[mawk] ))	&&	: "${ZSH_GIT_PROMPT_AWK_CMD:=mawk}"
(( $+commands[nawk] ))	&&	: "${ZSH_GIT_PROMPT_AWK_CMD:=nawk}"
: "${ZSH_GIT_PROMPT_AWK_CMD:=awk}"

function _zsh_git_prompt_git_status() {
		emulate -L zsh
		{
				[[ -n "$ZSH_GIT_PROMPT_SHOW_STASH" ]] && (
				c=$(command git rev-list --walk-reflogs --count refs/stash 2> /dev/null)
				[[ -n "$c" ]] && echo "# stash.count $c"
		)
		GIT_OPTIONAL_LOCKS=0 command git status --branch --porcelain=v2 2>&1 \
				|| echo "fatal: git command failed"
		} | $ZSH_GIT_PROMPT_AWK_CMD \
				-v PREFIX="$ZSH_THEME_GIT_PROMPT_PREFIX" \
				-v SUFFIX="$ZSH_THEME_GIT_PROMPT_SUFFIX" \
				-v SEPARATOR="$ZSH_THEME_GIT_PROMPT_SEPARATOR" \
				-v DETACHED="$ZSH_THEME_GIT_PROMPT_DETACHED" \
				-v BRANCH="$ZSH_THEME_GIT_PROMPT_BRANCH" \
				-v UPSTREAM_TYPE="$ZSH_GIT_PROMPT_SHOW_UPSTREAM" \
				-v UPSTREAM_SYMBOL="$ZSH_THEME_GIT_PROMPT_UPSTREAM_SYMBOL" \
				-v UPSTREAM_PREFIX="$ZSH_THEME_GIT_PROMPT_UPSTREAM_PREFIX" \
				-v UPSTREAM_SUFFIX="$ZSH_THEME_GIT_PROMPT_UPSTREAM_SUFFIX" \
				-v BEHIND="$ZSH_THEME_GIT_PROMPT_BEHIND" \
				-v AHEAD="$ZSH_THEME_GIT_PROMPT_AHEAD" \
				-v UNMERGED="$ZSH_THEME_GIT_PROMPT_UNMERGED" \
				-v STAGED="$ZSH_THEME_GIT_PROMPT_STAGED" \
				-v UNSTAGED="$ZSH_THEME_GIT_PROMPT_UNSTAGED" \
				-v UNTRACKED="$ZSH_THEME_GIT_PROMPT_UNTRACKED" \
				-v STASHED="$ZSH_THEME_GIT_PROMPT_STASHED" \
				-v CLEAN="$ZSH_THEME_GIT_PROMPT_CLEAN" \
				-v RC="%{$reset_color%}" \
				'
						BEGIN {
						ORS = "";
						fatal = 0;
						oid = "";
						head = "";
						upstream = "";
						ahead = 0;
						behind = 0;
						untracked = 0;
						unmerged = 0;
						staged = 0;
						unstaged = 0;
						stashed = 0;
				}

		$1 == "fatal:" {
		fatal = 1;
}

$2 == "branch.oid" {
oid = $3;
}

$2 == "branch.head" {
head = $3;
}

$2 == "branch.upstream" {
upstream = $3;
}

$2 == "branch.ab" {
ahead = $3;
behind = $4;
}

$1 == "?" {
++untracked;
}

$1 == "u" {
++unmerged;
}

$1 == "1" || $1 == "2" {
split($2, arr, "");
if (arr[1] != ".") {
		++staged;
}
if (arr[2] != ".") {
		++unstaged;
}
}

$2 == "stash.count" {
stashed = $3;
}
END {
if (fatal == 1) {
		exit(1);
}
print PREFIX;
print RC;
if (head == "(detached)") {
		print DETACHED;
		print substr(oid, 0, 7);
} else {
print BRANCH;
gsub("%", "%%", head);
print head;
}
print RC;
if (upstream != "") {
		gsub("%", "%%", upstream);
		if (UPSTREAM_TYPE == "symbol") {
				print UPSTREAM_SYMBOL;
		} else if (UPSTREAM_TYPE == "full") {
		print UPSTREAM_PREFIX;
		print upstream;
		print UPSTREAM_SUFFIX;
}
}
print RC;
if (behind < 0) {
		print BEHIND;
		printf "%d", behind * -1;
		print RC;
}
if (ahead > 0) {
		print AHEAD;
		printf "%d", ahead;
		print RC;
}
print SEPARATOR;

if (unmerged > 0) {
		print UNMERGED;
		print unmerged;
		print RC;
}
if (staged > 0) {
		print STAGED;
		print staged;
		print RC;
}
if (unstaged > 0) {
		print UNSTAGED;
		print unstaged;
		print RC;
}
if (untracked > 0) {
		print UNTRACKED;
		print untracked;
		print RC;
}
if (stashed > 0) {
		print STASHED;
		print stashed;
		print RC;
}
if (unmerged == 0 && staged == 0 && unstaged == 0 && untracked == 0) {
		print CLEAN;
		print RC;
}
print SUFFIX;
print RC;
}
'
}

function _zsh_git_prompt_git_status_secondary() {
		tags=$(command git tag --points-at=HEAD 2> /dev/null)
		[[ -z "$tags" ]] && return
		echo -n ${ZSH_THEME_GIT_PROMPT_SECONDARY_PREFIX}
		echo -n ${ZSH_THEME_GIT_PROMPT_TAGS_PREFIX}
		echo "$tags" | $ZSH_GIT_PROMPT_AWK_CMD \
				-v SEPARATOR="$ZSH_THEME_GIT_PROMPT_TAGS_SEPARATOR" \
				-v TAG="$ZSH_THEME_GIT_PROMPT_TAG" \
				-v RC="%{$reset_color%}" \
				'
						BEGIN {
						ORS = "";
				}
		{
				if (NR != 1) {
						print SEPARATOR;
						print RC;
				}
		print TAG;
		print $0;
		print RC;
}
'
echo -n ${ZSH_THEME_GIT_PROMPT_TAGS_SUFFIX}
echo -n ${ZSH_THEME_GIT_PROMPT_SECONDARY_SUFFIX}
}
zmodload zsh/system
function _zsh_git_prompt_async_request() {
		typeset -g _ZSH_GIT_PROMPT_ASYNC_FD _ZSH_GIT_PROMPT_ASYNC_PID
		if [[ -n "$_ZSH_GIT_PROMPT_ASYNC_FD" ]] && { true <&$_ZSH_GIT_PROMPT_ASYNC_FD } 2>/dev/null;
		then
				exec {_ZSH_GIT_PROMPT_ASYNC_FD}<&-
				zle -F $_ZSH_GIT_PROMPT_ASYNC_FD
				if [[ -o MONITOR ]]; then
						kill -TERM -$_ZSH_GIT_PROMPT_ASYNC_PID 2>/dev/null
				else
						kill -TERM $_ZSH_GIT_PROMPT_ASYNC_PID 2>/dev/null
				fi
		fi
		exec {_ZSH_GIT_PROMPT_ASYNC_FD}< <(
		echo $sysparams[pid]
		_zsh_git_prompt_git_status
		[[ -n "$ZSH_GIT_PROMPT_ENABLE_SECONDARY" ]] \
				&& echo -n "##secondary##" \
				&& _zsh_git_prompt_git_status_secondary
		)
		command true
		read _ZSH_GIT_PROMPT_ASYNC_PID <&$_ZSH_GIT_PROMPT_ASYNC_FD
		zle -F "$_ZSH_GIT_PROMPT_ASYNC_FD" _zsh_git_prompt_callback
}

_ZSH_GIT_PROMPT_STATUS_OUTPUT=""
_ZSH_GIT_PROMPT_STATUS_SECONDARY_OUTPUT=""
function _zsh_git_prompt_callback() {
		emulate -L zsh
		local old_primary="$_ZSH_GIT_PROMPT_STATUS_OUTPUT"
		local old_secondary="$_ZSH_GIT_PROMPT_STATUS_SECONDARY_OUTPUT"
		local fd_data
		local -a output
		if [[ -z "$2" || "$2" == "hup" ]]; then
				fd_data="$(cat <&$1)"
				output=( ${(s:##secondary##:)fd_data} )
				_ZSH_GIT_PROMPT_STATUS_OUTPUT="${output[1]}"
				_ZSH_GIT_PROMPT_STATUS_SECONDARY_OUTPUT="${output[2]}"
				if [[ "$old_primary" != "$_ZSH_GIT_PROMPT_STATUS_OUTPUT" ]] \
						|| [[ "$old_secondary" != "$_ZSH_GIT_PROMPT_STATUS_SECONDARY_OUTPUT" ]] ; then
										zle reset-prompt
										zle -R
				fi
				exec {1}<&-
		fi
		zle -F "$1"
		unset _ZSH_GIT_PROMPT_ASYNC_FD
}

function _zsh_git_prompt_precmd_hook() {
		if [[ -n "$ZSH_GIT_PROMPT_FORCE_BLANK" ]]; then
				_ZSH_GIT_PROMPT_STATUS_OUTPUT=""
				_ZSH_GIT_PROMPT_STATUS_SECONDARY_OUTPUT=""
		fi
		_zsh_git_prompt_async_request
}

if (( $+commands[git] )); then
		if [[ -z "$ZSH_GIT_PROMPT_NO_ASYNC" ]]; then
				autoload -U add-zsh-hook \
						&& add-zsh-hook precmd _zsh_git_prompt_precmd_hook
										function gitprompt() {
												echo -n "$_ZSH_GIT_PROMPT_STATUS_OUTPUT"
										}
								function gitprompt_secondary() {
										echo -n "$_ZSH_GIT_PROMPT_STATUS_SECONDARY_OUTPUT"
								}
				else
						function gitprompt() {
								_zsh_git_prompt_git_status
						}
				function gitprompt_secondary() {
						[[ -n "$ZSH_GIT_PROMPT_ENABLE_SECONDARY" ]] \
								&& _zsh_git_prompt_git_status_secondary
						}
		fi
else
		function gitprompt() { }
		function gitprompt_secondary() { }
fi
