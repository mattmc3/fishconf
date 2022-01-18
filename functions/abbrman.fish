function abbrman
    set -q abbrsfile; or set -U abbrsfile $__fish_config_dir/scripts/abbrs.fish

    if not test -f $abbrsfile
        echo >&2 "Cannot find abbrs file" && return 1
    end
    if test (count $argv) -eq 0
        echo >&2 "Expecting argument"
        return 1
    end
    switch $argv[1]
        case diff
            _abbr_diff $argv[2..]
        case reset
            _abbr_reset $argv[2..]
        case 'set'
            _abbr_set $argv[2..]
        case *
            echo >&2 "Unrecognized command '$argv[1]'" && return 1
    end
end

function _abbr_diff --description 'Diff abbrs'
    # dump abbreviations to a temp file
    set tmp1 (mktemp -t abbr-diff-abbrset)
    string match --regex --entire '^\s*abbr' <$abbrsfile |
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

function _abbr_reset --description 'Reset abbreviations'
    while true
        set message "Reset abbreviations to contents of abbrs.fish? [y/N] "
        read --local --prompt-str=$message confirm
        switch $confirm
            case Y y
                break
            case '' N n
                return 1
        end
    end
    for abbr_name in (abbr --list)
        abbr -e $abbr_name
    end
    source $abbrsfile
end

function _abbr_set --description 'Set abbreviations'
    source $abbrsfile
end
