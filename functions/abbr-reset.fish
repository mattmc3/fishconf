function abbr-reset --description 'Reset abbreviations'
    while true
        read -l -P "This will erase all your abbreviations. You sure? [y/N] " confirm
        switch $confirm
            case Y y
                break
            case '' N n
                return 1
        end
    end
    for abbr_name in (abbr -l)
        abbr -e $abbr_name
    end
    source $__fish_config_dir/functions/abbr-set.fish
    abbr-set
end
