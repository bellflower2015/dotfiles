[ -t 0 ] && stty stop undef
umask 022

export TERM=xterm-256color
export EDITOR=vim
export VISUAL=vim

export PATH=$HOME/bin:$PATH

unalias ls 2>/dev/null

if [ "$(type gnuls 2>/dev/null)" ]; then
    alias ls='gnuls --color=auto'
elif [ "$(type gls 2>/dev/null)" ]; then
    alias ls='gls --color=auto'
elif [ "$(/bin/ls --version 2>/dev/null| grep -s GNU)" ]; then
    alias ls='ls --color=auto'
else
    alias ls='ls -G'
fi

alias ll='ls -alF'

[ -f ~/.git-completion.bash ] && . ~/.git-completion.bash
[ -f ~/.git-prompt.sh ] && . ~/.git-prompt.sh

if $(type __git_ps1 &> /dev/null); then
    export PS1='[\[\033[32m\]\u@\h \[\033[34m\]\w\[\033[31m\]$(__git_ps1)\[\033[00m\]]\$ '
else
    export PS1='[\[\033[32m\]\u@\h \[\033[34m\]\w\[\033[00m\]]\$ '
fi

[ -f ~/.bashrc.local ] && . ~/.bashrc.local
