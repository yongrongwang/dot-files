#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='\[\033[01;32m\]\u \[\033[01;31m\]\h \[\033[01;33m\]\w\n\[\033[01;34m\]$ '
HISTCONTROL=ignoredups:erasedups
PROMPT_COMMAND="history -n; history -w; history -c; history -r; $PROMPT_COMMAND"
shopt -s histappend
alias ls='ls --color=auto'
alias ll='ls -alvhF --group-directories-first'
alias grep='grep --color=auto'
alias ssh='TERM=xterm-256color ssh'
alias ep='export http_proxy=http://127.0.0.1:8080/ && export https_proxy=$http_proxy'
alias up='unset http_proxy https_proxy'

source ~/.local/share/blesh/ble.sh
