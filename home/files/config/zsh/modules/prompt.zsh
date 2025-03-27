autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git*' formats '%r %S %b'

precmd() {
	vcs_info

	if [[ ! -z $vcs_info_msg_0_ ]]
	then
		_vcs_info_msg=(${(@s/ /)vcs_info_msg_0_})
		PS1_PATH="%F{blue}%B${_vcs_info_msg[1]}" 
		if [ "${_vcs_info_msg[2]}" != "." ]; then;
			PS1_PATH="${PS1_PATH}/%b%F{green}${_vcs_info_msg[2]}%f"
		else
			PS1_PATH="${PS1_PATH}%b%f"
		fi
		PS1_PATH="${PS1_PATH} (%F{red}${_vcs_info_msg[3]}%f)"
	else
		PS1_PATH="%F{green}%~%f" 
	fi
}

setopt prompt_subst

PS1_NL=$'\n'

PS1_ID="%F{red}%B%n%b%F{yellow}@%m%f"
PS1_SYMBOL="->"

PS1='${PS1_ID}: ${PS1_PATH}${PS1_NL}${PS1_SYMBOL} '
