export PATH="$HOME/.local/bin:$PATH"
typeset -U PATH
export MANPAGER="nvim +Man!"
export FZF_DEFAULT_COMMAND="fd --type f"
export FZF_DEFAULT_OPTS="-e -m --height 100% --layout reverse --border none --preview-border none --no-separator --no-scrollbar"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_OPTS="--preview 'cat {}'"
export FZF_ALT_C_COMMAND="fd --type d"
export NNN_PLUG='m:nmount;c:!wl-copy -t image < "$nnn"*'
export BEMENU_OPTS="-i -p '' -H 19 --fb '#282828' --ff '#ebdbb2' --nb '#282828' --nf '#ebdbb2' --tb '#282828' --hb '#282828' --tf '#fb4934' --hf '#fabd2f' --nf '#ebdbb2' --af '#ebdbb2' --ab '#282828'"
