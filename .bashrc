#
# ~/.bashrc
#

#if not running interactively dont do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias dotfiles='/usr/bin/git --git-dir=$HOME/dotfiles --work-tree=$HOME'

export SUDO_EDITOR=/usr/bin/nvim
#export PYTHONPATH=/usr/bin/python
