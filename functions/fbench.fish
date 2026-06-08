function fbench \
    --description 'benchmark fish' \
    --argument-names outfile

    test -n "$outfile"; or set outfile $__fish_config_dir/fishprof_(date '+%Y%m%d_%H%M%S').txt
    echo "running fish 10 times..."
    for i in (seq 10)
        /usr/bin/time fish -i -c exit
    end
    echo "Writing fish profile file to $outfile"
    fish --profile-startup=$outfile -c exit
    echo "Profile: $outfile"
    echo "Top slow calls (>1000μs):"
    grep -E "^\s+[0-9]{4,}" $outfile | head -25
end
