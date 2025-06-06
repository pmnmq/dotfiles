exec_path="/opt/homebrew/bin/fzf"

if test $ZSHRC_FLAG_OS = "Linux"; then
	exec_path="/home/linuxbrew/.linuxbrew/bin/fzf"
fi

if [[ ! -x "$exec_path" ]]; then
	exec_path="fzf"
fi

source <(fzf --zsh)
export FZF_DEFAULT_OPTS='--height 50% --preview "$XDG_CONFIG_HOME/zsh/fzf-preview.sh {}"'
export FZF_DEFAULT_COMMAND='fd --hidden --follow'
export FZF_COMPLETION_TRIGGER='\'

