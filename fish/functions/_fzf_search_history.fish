function _fzf_search_history
    if test -z "$fish_private_mode"
        builtin history merge
    end

    set -f commands_selected (
        builtin history |
        fzf --height 50% --multi --query=(commandline)
    )

    if test $status -eq 0
        commandline --replace -- $commands_selected
    end

    commandline --function repaint
end
