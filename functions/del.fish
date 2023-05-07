function del --description "safe rm"
    if type -q rem
        touch -- $argv
        rem $argv
    else if type -q shell-safe-rm
        shell-safe-rm $argv
    else
        echo "shell-safe-rm not found: https://github.com/kaelzhang/shell-safe-rm" >&2
        commandline -r "/bin/rm $argv"
    end
end
