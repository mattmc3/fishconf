function fbench \
    --description 'benchmark fish' \
    --argument-names outfile threshold

    test -n "$outfile"; or set outfile $__fish_config_dir/fishprof_(date '+%Y%m%d_%H%M%S').txt
    test -n "$threshold"; or set threshold 100
    echo "running fish 10 times..."
    for i in (seq 10)
        /usr/bin/time fish -i -c exit
    end
    echo "Writing fish profile file to $outfile"
    fish --profile-startup=$outfile -c exit
    echo "Profile: $outfile"
    echo "Top slow calls (>" $threshold "μs):"
    grep -E "^\s+[0-9]{1,}" $outfile | awk -v t=$threshold '$1 > t' | head -25
end
