OS="$(uname)"
exec_path="/opt/homebrew/bin/fzf"

if test $OS = "Linux"; then
	exec_path="/home/linuxbrew/.linuxbrew/bin/fzf"
fi

if test -x $exec_path; then
	source <(fzf --zsh)
	export FZF_DEFAULT_OPTS='--height 50% --preview "$XDG_CONFIG_HOME/zsh/fzf-preview.sh {}"'
	export FZF_DEFAULT_COMMAND='fd --hidden --follow'
	export FZF_COMPLETION_TRIGGER='\'
fi
