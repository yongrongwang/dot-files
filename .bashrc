#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1="\[\033[01;32m\]\u \[\033[01;31m\]\h \[\033[01;33m\]\w\n\[\033[01;34m\]$ \[\033[01;35m\]"
HISTSIZE=10000
HISTCONTROL=ignoredups:erasedups
shopt -s histappend
alias ls="ls --color=auto"
alias ll="ls -alvhF --group-directories-first"
alias grep="grep --color=auto"
alias ep="export http_proxy=http://127.0.0.1:8080/ && export https_proxy=$http_proxy"
alias up="unset http_proxy https_proxy"

NNN_PLUG_DEFAULT="o:fzopen;d:diffs;m:nmount;v:imgview"
NNN_PLUG_INLINE='e:-!sudo -E $EDITOR "$nnn"*;c:!wl-copy < "$nnn"*'
export NNN_PLUG="$NNN_PLUG_DEFAULT;$NNN_PLUG_INLINE"

export FZF_DEFAULT_COMMAND="fd --type f"
export FZF_DEFAULT_OPTS="-e -m --height 100% --layout reverse --border none --preview-border none --no-separator --no-scrollbar"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_OPTS="--preview 'cat {}'"
export FZF_ALT_C_COMMAND="fd --type d"
alias ffc="$FZF_DEFAULT_COMMAND"
alias fdc="$FZF_ALT_C_COMMAND"
_fzf_compgen_path() {
    fd --type f "$1"
}
_fzf_compgen_dir() {
    fd --type d "$1"
}
eval "$(fzf --bash)"
FZF_RG_COMMAND="rg -n -S --no-heading"
FZF_RG_OPTS="-d ':' --preview 'cat {1}' --preview-window +{2}/2"
alias fr="$FZF_RG_COMMAND '$1' | fzf $FZF_RG_OPTS"
alias rc="$FZF_RG_COMMAND"
alias fps="sudo pacman -Fy && pacman -Slq | fzf --preview 'pacman -Si {1}'"
alias fpq="pacman -Qq | fzf --preview 'pacman -Qi {1}'"

source ~/.local/share/blesh/ble.sh
