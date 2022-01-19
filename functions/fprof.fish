function fprof --description 'Profile fish startup'
    fish --profile-startup=$__fish_config_dir/fishprof.txt -c exit
    cat $__fish_config_dir/fishprof.txt
end
