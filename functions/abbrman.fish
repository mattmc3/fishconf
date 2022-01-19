function abbrman -d 'Manage my abbreviations'
    set -q abbrfile; or set -g abbrfile $__fish_config_dir/scripts/abbrs.fish

    if not test -f $abbrfile
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
        case set
            _abbr_set $argv[2..]
        case *
            echo >&2 "Unrecognized command '$argv[1]'" && return 1
    end
end

function _abbr_diff --description 'Diff abbrs'
    # dump session abbreviations to a temp file
    set tmp1 (mktemp -t abbr-diff-session)
    string match --regex --entire '^\s*abbr' <$abbrfile |
        sort >$tmp1

    # dump config abbrs to temp file
    set tmp2 (mktemp -t abbr-diff-config)
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
    source $abbrfile
end

function _abbr_set --description 'Set abbreviations'
    source $abbrfile
end
