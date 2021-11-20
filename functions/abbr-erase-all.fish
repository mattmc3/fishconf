function abbr-erase-all --description 'Erase all abbr'
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
    set -q MY_ABBR_SET && set -e MY_ABBR_SET
end
