# bash completion for stern                                -*- shell-script -*-
# ex: ts=4 sw=4 et filetype=sh

__stern_debug()
{
	if [[ -n ${BASH_COMP_DEBUG_FILE} ]]; then
		echo "$*" >> "${BASH_COMP_DEBUG_FILE}"
	fi
}

# Homebrew on Macs have version 1.3 of bash-completion which doesn't include
# _init_completion. This is a very minimal version of that function.
__stern_init_completion()
{
	COMPREPLY=()
	_get_comp_words_by_ref "$@" cur prev words cword
}

__stern_index_of_word()
{
	local w word=$1
	shift
	index=0
	for w in "$@"; do
		[[ $w = "$word" ]] && return
			index=$((index+1))
			done
		index=-1
}

__stern_contains_word()
{
	local w word=$1; shift
		for w in "$@"; do
			[[ $w = "$word" ]] && return
				done
		return 1
}

__stern_handle_reply()
{
	__stern_debug "${FUNCNAME[0]}"
		case $cur in
		-*)
		if [[ $(type -t compopt) = "builtin" ]]; then
			compopt -o nospace
		fi
			local allflags
				if [ ${#must_have_one_flag[@]} -ne 0 ]; then
					allflags=("${must_have_one_flag[@]}")
				else
					allflags=("${flags[*]} ${two_word_flags[*]}")
				fi
				COMPREPLY=( $(compgen -W "${allflags[*]}" -- "$cur") )
				if [[ $(type -t compopt) = "builtin" ]]; then
					[[ "${COMPREPLY[0]}" == *= ]] || compopt +o nospace
				fi
	# complete after --flag=abc
		if [[ $cur == *=* ]]; then
			if [[ $(type -t compopt) = "builtin" ]]; then
				compopt +o nospace
			fi
			local index flag
			flag="${cur%=*}"
			__stern_index_of_word "${flag}" "${flags_with_completion[@]}"
			COMPREPLY=()
				if [[ ${index} -ge 0 ]]; then
					PREFIX=""
					cur="${cur#*=}"
					${flags_completion[${index}]}
					if [ -n "${ZSH_VERSION}" ]; then
						# zsh completion needs --flag= prefix
						eval "COMPREPLY=( \"\${COMPREPLY[@]/#/${flag}=}\" )"
					fi
				fi
		fi
	return 0;
	;;
	esac
	# check if we are handling a flag with special work handling
	local index
	__stern_index_of_word "${prev}" "${flags_with_completion[@]}"
	if [[ ${index} -ge 0 ]]; then
		${flags_completion[${index}]}
		return
	fi

	if [[ ${cur} != "${words[cword]}" ]]; then
		return
	fi
	local completions
	completions=("${commands[@]}")
	if [[ ${#must_have_one_noun[@]} -ne 0 ]]; then
		completions=("${must_have_one_noun[@]}")
	fi
	if [[ ${#must_have_one_flag[@]} -ne 0 ]]; then
		completions+=("${must_have_one_flag[@]}")
	fi
	COMPREPLY=( $(compgen -W "${completions[*]}" -- "$cur") )
	if [[ ${#COMPREPLY[@]} -eq 0 && ${#noun_aliases[@]} -gt 0 && ${#must_have_one_noun[@]} -ne 0 ]]; then
		COMPREPLY=( $(compgen -W "${noun_aliases[*]}" -- "$cur") )
	fi
	if [[ ${#COMPREPLY[@]} -eq 0 ]]; then
		declare -F __custom_func >/dev/null && __custom_func
	fi
	# available in bash-completion >= 2, not always present on macOS
	if declare -F __ltrim_colon_completions >/dev/null; then
		__ltrim_colon_completions "$cur"
	fi

	# If there is only 1 completion and it is a flag with an = it will be completed
	# but we don't want a space after the =
	if [[ "${#COMPREPLY[@]}" -eq "1" ]] && [[ $(type -t compopt) = "builtin" ]] && [[ "${COMPREPLY[0]}" == --*= ]]; then
		compopt -o nospace
	fi
}

# The arguments should be in the form "ext1|ext2|extn"
__stern_handle_filename_extension_flag()
{
	local ext="$1"
	_filedir "@(${ext})"
}

__stern_handle_subdirs_in_dir_flag()
{
	local dir="$1"
	pushd "${dir}" >/dev/null 2>&1 && _filedir -d && popd >/dev/null 2>&1
}

__stern_handle_flag()
{
	__stern_debug "${FUNCNAME[0]}: c is $c words[c] is ${words[c]}"
	# if a command required a flag, and we found it, unset must_have_one_flag()
	local flagname=${words[c]}
	local flagvalue
	# if the word contained an =
	if [[ ${words[c]} == *"="* ]]; then
		flagvalue=${flagname#*=} # take in as flagvalue after the =
		flagname=${flagname%=*} # strip everything after the =
		flagname="${flagname}=" # but put the = back
	fi
	__stern_debug "${FUNCNAME[0]}: looking for ${flagname}"
	if __stern_contains_word "${flagname}" "${must_have_one_flag[@]}"; then
		must_have_one_flag=()
	fi
	# if you set a flag which only applies to this command, don't show subcommands
	if __stern_contains_word "${flagname}" "${local_nonpersistent_flags[@]}"; then
		commands=()
	fi
	# keep flag value with flagname as flaghash
	# flaghash variable is an associative array which is only supported in bash > 3.
	if [[ -z "${BASH_VERSION}" || "${BASH_VERSINFO[0]}" -gt 3 ]]; then
		if [ -n "${flagvalue}" ] ; then
			flaghash[${flagname}]=${flagvalue}
		elif [ -n "${words[ $((c+1)) ]}" ] ; then
			flaghash[${flagname}]=${words[ $((c+1)) ]}
		else
			flaghash[${flagname}]="true" # pad "true" for bool flag
		fi
	fi
	# skip the argument to a two word flag
	if __stern_contains_word "${words[c]}" "${two_word_flags[@]}"; then
		c=$((c+1))
		# if we are looking for a flags value, don't show commands
		if [[ $c -eq $cword ]]; then
			commands=()
		fi
	fi
	c=$((c+1))
}

__stern_handle_noun()
{
	__stern_debug "${FUNCNAME[0]}: c is $c words[c] is ${words[c]}"
	if __stern_contains_word "${words[c]}" "${must_have_one_noun[@]}"; then
		must_have_one_noun=()
	elif __stern_contains_word "${words[c]}" "${noun_aliases[@]}"; then
		must_have_one_noun=()
	fi
	nouns+=("${words[c]}")
	c=$((c+1))
}

__stern_handle_command()
{
	__stern_debug "${FUNCNAME[0]}: c is $c words[c] is ${words[c]}"
	local next_command
	if [[ -n ${last_command} ]]; then
		next_command="_${last_command}_${words[c]//:/__}"
	else
		if [[ $c -eq 0 ]]; then
			next_command="_stern_root_command"
		else
			next_command="_${words[c]//:/__}"
		fi
	fi
	c=$((c+1))
	__stern_debug "${FUNCNAME[0]}: looking for ${next_command}"
	declare -F "$next_command" >/dev/null && $next_command
}

__stern_handle_word()
{
	if [[ $c -ge $cword ]]; then
		__stern_handle_reply
		return
	fi
	__stern_debug "${FUNCNAME[0]}: c is $c words[c] is ${words[c]}"
	if [[ "${words[c]}" == -* ]]; then
		__stern_handle_flag
	elif __stern_contains_word "${words[c]}" "${commands[@]}"; then
		__stern_handle_command
	elif [[ $c -eq 0 ]]; then
		__stern_handle_command
	elif __stern_contains_word "${words[c]}" "${command_aliases[@]}"; then
		# aliashash variable is an associative array which is only supported in bash > 3.
		if [[ -z "${BASH_VERSION}" || "${BASH_VERSINFO[0]}" -gt 3 ]]; then
			words[c]=${aliashash[${words[c]}]}
			__stern_handle_command
		else
			__stern_handle_noun
		fi
	else
		__stern_handle_noun
	fi
	__stern_handle_word
}

__is_kubectl_installed=true
if ! which kubectl >/dev/null 2>&1; then
	__is_kubectl_installed=false
fi

__kubectl_override_flag_list=(kubeconfig context namespace)
__kubectl_override_flags()

{
	local ${__kubectl_override_flag_list[*]} two_word_of of
		for w in "${words[@]}"; do
			if [ -n "${two_word_of}" ]; then
				eval "${two_word_of}=\"--${two_word_of}=\${w}\""
				two_word_of=
				continue
			fi
			for of in "${__kubectl_override_flag_list[@]}"; do
				case "${w}" in
					--${of}=*)
						eval "${of}=\"${w}\""
						;;
					--${of})
						two_word_of="${of}"
						;;
					esac
			done
			if [ "${w}" == "--all-namespaces" ]; then
				namespace="--all-namespaces"
			fi
		done
		for of in "${__kubectl_override_flag_list[@]}"; do
			if eval "test -n \"\$${of}\""; then
				eval "echo \${${of}}"
			fi
		done
}

__kubectl_get_namespaces()
{
	local template kubectl_out
		if ! $__is_kubectl_installed; then
			return 1
		fi
		template="{{ range .items  }}{{ .metadata.name }} {{ end }}"
		if kubectl_out=$(kubectl get -o template --template="${template}" namespace 2>/dev/null); then
			COMPREPLY=( $( compgen -W "${kubectl_out[*]}" -- "$cur" ) )
		fi
}

__kubectl_config_get_contexts()
{
	local template kubectl_out
		if ! $__is_kubectl_installed; then
			return 1
		fi
		template="{{ range .contexts  }}{{ .name }} {{ end }}"
		if kubectl_out=$(kubectl config $(__kubectl_override_flags) -o template --template="${template}" view 2>/dev/null); then
			COMPREPLY=( $( compgen -W "${kubectl_out[*]}" -- "$cur" ) )
		fi
}

_stern_root_command()
{
	last_command="stern"
	command_aliases=()
	commands=()
	flags=()
	two_word_flags=()
	local_nonpersistent_flags=()
	flags_with_completion=()
	flags_completion=()
	flags+=("--all-namespaces")
	local_nonpersistent_flags+=("--all-namespaces")
	flags+=("--color=")
	local_nonpersistent_flags+=("--color=")
	flags+=("--completion=")
	local_nonpersistent_flags+=("--completion=")
	flags+=("--container=")
	two_word_flags+=("-c")
	local_nonpersistent_flags+=("--container=")
	flags+=("--container-state=")
	local_nonpersistent_flags+=("--container-state=")
	flags+=("--context=")
	flags_with_completion+=("--context")
	flags_completion+=("__kubectl_config_get_contexts")
	local_nonpersistent_flags+=("--context=")
	flags+=("--exclude=")
	two_word_flags+=("-e")
	local_nonpersistent_flags+=("--exclude=")
	flags+=("--exclude-container=")
	two_word_flags+=("-E")
	local_nonpersistent_flags+=("--exclude-container=")
	flags+=("--help")
	flags+=("-h")
	local_nonpersistent_flags+=("--help")
	flags+=("--kubeconfig=")
	local_nonpersistent_flags+=("--kubeconfig=")
	flags+=("--namespace=")
	flags_with_completion+=("--namespace")
	flags_completion+=("__kubectl_get_namespaces")
	two_word_flags+=("-n")
	flags_with_completion+=("-n")
	flags_completion+=("__kubectl_get_namespaces")
	local_nonpersistent_flags+=("--namespace=")
	flags+=("--output=")
	two_word_flags+=("-o")
	local_nonpersistent_flags+=("--output=")
	flags+=("--selector=")
	two_word_flags+=("-l")
	local_nonpersistent_flags+=("--selector=")
	flags+=("--since=")
	two_word_flags+=("-s")
	local_nonpersistent_flags+=("--since=")
	flags+=("--tail=")
	local_nonpersistent_flags+=("--tail=")
	flags+=("--template=")
	local_nonpersistent_flags+=("--template=")
	flags+=("--timestamps")
	flags+=("-t")
	local_nonpersistent_flags+=("--timestamps")
	flags+=("--version")
	flags+=("-v")
	local_nonpersistent_flags+=("--version")
	must_have_one_flag=()
	must_have_one_noun=()
	noun_aliases=()
}

__start_stern()
{
	local cur prev words cword
	declare -A flaghash 2>/dev/null || :
	declare -A aliashash 2>/dev/null || :
	if declare -F _init_completion >/dev/null 2>&1; then
			_init_completion -s || return
	else
		__stern_init_completion -n "=" || return
	fi
	local c=0
	local flags=()
	local two_word_flags=()
	local local_nonpersistent_flags=()
	local flags_with_completion=()
	local flags_completion=()
	local commands=("stern")
	local must_have_one_flag=()
	local must_have_one_noun=()
	local last_command
	local nouns=()
	__stern_handle_word
}

if [[ $(type -t compopt) = "builtin" ]]; then
	complete -o default -F __start_stern stern
else
	complete -o default -o nospace -F __start_stern stern
fi
