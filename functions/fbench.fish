function fbench \
    --description 'benchmark fish' \
    --argument-names shellname

    test -n "$shellname" || set shellname fish
    echo "running fish 10 times..."
    for i in (seq 10)
        /usr/bin/time fish -i -c exit
    end
    echo "Writing fish profile file to $__fish_config_dir/fishprof.txt"
    fish --profile-startup=$__fish_config_dir/fishprof.txt -c exit
end
