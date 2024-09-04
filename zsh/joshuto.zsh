function joshuto-cd() {
	ID="$$"
	mkdir -p /tmp/$USER
	OUTPUT_FILE="/tmp/$USER/joshuto-cwd-$ID"
	env joshuto --output-file "$OUTPUT_FILE" $@
	exit_code=$?

	case "$exit_code" in
	# regular exit
	0) ;;
	# output contains current directory
	101)
		JOSHUTO_CWD=$(cat "$OUTPUT_FILE")
		cd "$JOSHUTO_CWD"
		;;
	# output selected files
	102)
		cat "$OUTPUT_FILE"
		;;
	*)
		echo "Exit code: $exit_code"
		;;
	esac
}

function widget-joshuto-cd() {
	BUFFER="joshuto-cd"
	zle accept-line
}

zle -N widget-joshuto-cd

# bindkey '^o' widget-joshuto-cd # ctrl-o
