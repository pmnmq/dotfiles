alias c="clear"
alias s="fastfetch"
# alias cs="cowsay"
# alias fl="figlet"
alias lg="lazygit"
alias sv="source ./venv/bin/activate"
alias jn="jupyter notebook"
[ "$TERM" = "xterm-kitty" ] && alias ssh="kitty +kitten ssh"
[ "$(uname)" = "Darwin" ] && alias code="/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code"
[ "$(uname)" = "Darwin" ] && alias git='LANG=en_US git'
# alias _op='op'
alias sdv="source ./.venv/bin/activate"

[ "$ZSHRC_FLAG_LOAD_ALL" = false ] && alias nvim='nvim --noplugin'
