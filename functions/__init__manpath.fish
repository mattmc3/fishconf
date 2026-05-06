function __init__manpath --description 'Bootstrap MANPATH with system man dirs'
    set -q MANPATH; or set -gx MANPATH ''
    for mp in (path filter $__fish_data_dir/man /usr/local/share/man /usr/share/man)
        set -ax MANPATH $mp
    end
end
