###-begin-codefresh-completions-###
#
# codefresh command completion script
#
# Installation: codefresh completion >> ~/.bashrc
#    or codefresh completion >> ~/.bash_profile on OSX.
#
_codefresh_completions()
{
		local cur args type_list

		cur="${COMP_WORDS[COMP_CWORD]}"
		args=("${COMP_WORDS[@]}")

		# ask codefresh to generate completions.
		type_list=$(codefresh --get-yargs-completions "${args[@]}")

		if [[ ${type_list} == '__files_completion__' ]]; then
				_filedir "@(yaml|yml|json)"
		else
				COMPREPLY=( $(compgen -W "${type_list}" -- ${cur}) )
		fi

		return 0
}
complete -F _codefresh_completions codefresh
###-end-codefresh-completions-###
