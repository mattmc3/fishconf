function mand --description 'Open a man page with Dash.app'
    if test (count $argv) -gt 0
        open "dash://manpages:$argv" 2>/dev/null
        if test $status -ne 0
            echo "Dash is not installed" >&2
        end
    else
        echo 'What manual page do you want?' >&2
    end
end
