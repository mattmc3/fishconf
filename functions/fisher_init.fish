function fisher_init \
    --description "Initialize fisher"

    set -q fisher_path || set -g fisher_path $__fish_config_dir/fisher

    if test "$fisher_paths_initialized" != true
        set fish_function_path $fish_function_path[1] $fisher_path/functions $fish_function_path[2..]
        set fish_complete_path $fish_complete_path[1] $fisher_path/completions $fish_complete_path[2..]
        set -g fisher_paths_initialized true
    end

    if not test -d $fisher_path
        #git clone --depth 1 https://github.com/jorgebucaran/fisher.git $fisher_path
        git clone --depth 1 --branch custom https://github.com/mattmc3/fisher $fisher_path
        fisher update
    end

    for file in $fisher_path/conf.d/*.fish
        if ! test -f $__fish_config_dir/conf.d/(path basename -- $file)
            and test -f $file && test -r $file
            builtin source $file
        end
    end
end
