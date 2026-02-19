function git_ahead -a ahead behind diverged none
    not git_is_repo && return

    set -l commit_count (command git rev-list --count --left-right "@{upstream}...HEAD" 2> /dev/null)

    switch "$commit_count"
        case ""
            # no upstream
        case "0"\t"0"
            test -n "$none" && echo "$none" || echo ""
        case "*"\t"0"
            test -n "$behind" && echo "$behind" || echo -
        case "0"\t"*"
            test -n "$ahead" && echo "$ahead" || echo "+"
        case "*"
            test -n "$diverged" && echo "$diverged" || echo "±"
    end
end
