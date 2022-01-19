function aliasman -d 'Manage my aliases'
    set -q aliasfile; or set -g aliasfile $__fish_config_dir/scripts/aliases.fish

    if not test -f $aliasfile
        echo >&2 "Cannot find aliases file" && return 1
    end
    if test (count $argv) -eq 0
        echo >&2 "Expecting argument"
        echo >&2 "usage: aliasman {diff,save}"
        return 1
    end
    switch $argv[1]
        case diff
            _alias_diff $argv[2..]
        case save
            _alias_save $argv[2..]
        case *
            echo >&2 "Unrecognized command '$argv[1]'" && return 1
    end
end

function _alias_diff --description 'Diff aliases'
    # dump session aliases to a temp file
    set tmp1 (mktemp -t alias-diff-session)
    string match --regex --entire '^\s*alias' <$aliasfile |
        sort >$tmp1

    # dump config aliases to temp file
    set tmp2 (mktemp -t alias-diff-config)
    alias >$tmp2

    # show diff
    diff --ignore-all-space $tmp2 $tmp1

    for tmp in $tmp1 $tmp2
        test -f $tmp && rm $tmp
    end
end

function _alias_save --description \
    'Save the current definition of all specified aliases to file'

    set -l aliasdir $__fish_config_dir/functions/aliases
    test -d $aliasdir || mkdir -p $aliasdir

    set -l aliases (alias | awk '{print $2}')
    set -l oldaliases $__fish_config_dir/functions/aliases/*.fish

    # clear prior aliases
    for f in $oldaliases
        rm $f
    end

    # save new aliases
    for a in $aliases
        if string match 'fish_*' $a
            continue
        end
        functions $a >$aliasdir/"$a".fish

        # could use fish_indent, but I only care about tabs
        # fish_indent -w $aliasdir/"$a".fish

        # replace tab with 4 spaces
        sed -i '' -E "s/"\t"/    /g" $aliasdir/"$a".fish
    end
end
