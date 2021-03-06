
export PATH=/usr/local/sbin:$PATH
export PATH=/usr/local/bin:$PATH
[[ -d ~/bin ]] && export PATH=~/bin:$PATH

#
# Host completion
#

_complete_hosts () {
	COMPREPLY=()
	cur="${COMP_WORDS[COMP_CWORD]}"
	host_list=`{
		for c in /etc/ssh_config /etc/ssh/ssh_config ~/.ssh/config
			do [ -r $c ] && sed -n -e 's/^Host[[:space:]]//p' -e 's/^[[:space:]]*HostName[[:space:]]//p' $c
		done
		for k in /etc/ssh_known_hosts /etc/ssh/ssh_known_hosts ~/.ssh/known_hosts
			do [ -r $k ] && egrep -v '^[#\[]' $k|cut -f 1 -d ' '|sed -e 's/[,:].*//g'
		done
		sed -n -e 's/^[0-9][0-9\.]*//p' /etc/hosts; }|tr ' ' '\n'|grep -v '*'`
	COMPREPLY=( $(compgen -W "${host_list}" -- $cur))
	return 0
}
complete -F _complete_hosts ssh
complete -F _complete_hosts host

#
# Correct LANG, LC_CTYPE, LC_ALL
#

export LC_CTYPE=en_US.UTF-8
export LANG=en_US.UTF-8
unset LC_ALL

#
# Source additional scripts
#

[[ -f ~/.profile ]] && source ~/.profile
[[ -f ~/.git-prompt.sh ]] && source ~/.git-prompt.sh
[[ -f ~/.git-completion.bash ]] && source ~/.git-completion.bash
[[ -f ~/.git-flow-completion.bash ]] && source ~/.git-flow-completion.bash
[[ -f ~/.bashrc ]]  && source ~/.bashrc
