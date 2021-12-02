function abbr-diff \
    --description "Show the differences between the enviroment abbrs and the dotfiles ones"

    if not test -f $__fish_config_dir/functions/abbr-set.fish
        echo >&2 "Cannot find abbr-set fish function file" && return 1
    end

    # dump abbr-set to temp file
    set tmp1 (mktemp -t abbr-diff-abbrset)
    string match --regex --entire '^\s*abbr' <$__fish_config_dir/functions/abbr-set.fish |
    sort >$tmp1

    # dump env abbrs to temp file
    set tmp2 (mktemp -t abbr-diff-fishabbr)
    abbr >$tmp2

    # show diff
    diff --ignore-all-space $tmp2 $tmp1

    for tmp in $tmp1 $tmp2
        test -f $tmp && rm $tmp
    end
end
