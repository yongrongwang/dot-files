LINE=$'\n'
PROMPT="%F{green}%n%f %F{red}%m%f %F{yellow}%~%f${LINE}%F{blue}$%f "
HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000
SAVEHIST=$HISTSIZE
setopt APPEND_HISTORY
setopt HIST_SAVE_NO_DUPS
alias ls="ls --color=auto"
alias ll="ls -alvhF --group-directories-first"
alias grep="grep --color=auto"
alias fps="pacman -Slq | fzf --preview 'pacman -Si {1}'"
alias fpq="pacman -Qq | fzf --preview 'pacman -Qi {1}'"
alias ep="export http_proxy=http://127.0.0.1:8080/ https_proxy=http://127.0.0.1:8080/"
alias up="unset http_proxy https_proxy"
bindkey -e
_fzf_compgen_path() { fd --type f "$1" }
_fzf_compgen_dir() { fd --type d "$1" }
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source <(fzf --zsh)
