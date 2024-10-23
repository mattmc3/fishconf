function fbench \
    --description 'benchmark fish' \
    --argument-names outfile

    test -n "$outfile" || set outfile $__fish_config_dir/fishprof_(date '+%Y%m%d_%H%M%S').txt
    echo "running fish 10 times..."
    for i in (seq 10)
        /usr/bin/time fish -i -c exit
    end
    echo "Writing fish profile file to $outfile"
    fish --profile-startup=$outfile -c exit
    awk 'NR==1 || $3==">"{print}' $outfile
end
