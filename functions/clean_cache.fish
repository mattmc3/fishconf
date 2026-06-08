function clean_cache --description 'Clean stale entries in fish cache'
    mkdir -p $__fish_config_dir/.cache
    find $__fish_config_dir/.cache -name '*.fish' -type f -mmin +1200 -delete &
    disown
end
