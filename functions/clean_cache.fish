function clean_cache -a max_age_hours --description 'Clean stale entries in fish cache'
    if test -z $max_age_hours
        set max_age_hours 20
    end
    set -l max_age_minutes (math "$max_age_hours * 60")
    test -d $__fish_config_dir/.cache; or mkdir -p $__fish_config_dir/.cache
    find $__fish_config_dir/.cache -name '*.fish' -type f -mmin +$max_age_minutes -delete
end
