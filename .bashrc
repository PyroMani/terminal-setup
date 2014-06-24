
if [[ $- != *i* ]] ; then
        return
fi

#
#  START Taken from Gentoo
#
shopt -s checkwinsize
shopt -s histappend

case ${TERM} in
    xterm*|rxvt*|Eterm|aterm|kterm|gnome*|interix|iterm2)
        PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/$HOME/~}\007"'
            ;;
    screen)
        PROMPT_COMMAND='echo -ne "\033_${USER}@${HOSNAME%%.*}:${PWD/$HOME/~}\033\\"'
            ;;
esac

use_color=true

if ${use_color} ; then
    if type -P dircolors >/dev/null ; then
        if [[ -f ~/.dir_colors ]] ; then
            eval $(dircolors -b ~/.dir_colors)
        elif [[ -f /etc/DIR_COLORS ]] ; then
            eval $(dircolors -b /etc/DIR_COLORS)
        fi
    fi
    if [[ ${EUID} == 0 ]] ; then
        PS1='\[\033[01;31m\]\h\[\033[01;34m\] \W \$\[\033[00m\] '
    else
        PS1='\[\033[01;32m\]\u@\h\[\033[01;34m\] \W\[\033[0;33m\]$(__git_ps1) \[\033[01;34m\]\$\[\033[00m\] '
    fi
else
    if [[ ${EUID} == 0 ]] ; then
        PS1='\u@\h \W \$ '
    else
        PS1='\u@\h \w \$ '
    fi
fi

#
# END taken from gentoo
#

export EDITOR=vim
export BUNDLER_EDITOR=sublime
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
