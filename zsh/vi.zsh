bindkey -v
bindkey -M vicmd "i" vi-insert
bindkey -M vicmd "I" vi-insert-bol
bindkey -M vicmd "l" vi-forward-char
bindkey -M vicmd "h" vi-backward-char
bindkey -M vicmd "L" vi-end-of-line
bindkey -M vicmd "H" vi-beginning-of-line
bindkey -M vicmd "k" up-line-or-history
bindkey -M vicmd "j" down-line-or-history

function zle-keymap-select {
	if [[ ${KEYMAP} == vicmd ]] || [[ $1 = 'block' ]]; then
		echo -ne '\e[1 q'
	elif [[ ${KEYMAP} == main ]] || [[ ${KEYMAP} == viins ]] || [[ ${KEYMAP} = '' ]] || [[ $1 = 'beam' ]]; then
		echo -ne '\e[5 q'
	fi
}

zle -N zle-keymap-select
echo -ne '\e[5 q'
