function __init__fisher --description 'Bootstrap fisher and source plugin conf.d files'
    set -q fisher_path; or set -gx fisher_path $__fish_config_dir/.fisher

    if not contains $fisher_path/functions $fish_function_path
        set --local idx (contains -i $__fish_config_dir/functions $fish_function_path)
        set fish_function_path $fish_function_path[1..$idx] $fisher_path/functions $fish_function_path[(math $idx + 1)..]
    end

    if not contains $fisher_path/completions $fish_complete_path
        set --local idx (contains -i $__fish_config_dir/completions $fish_complete_path)
        set fish_complete_path $fish_complete_path[1..$idx] $fisher_path/completions $fish_complete_path[(math $idx + 1)..]
    end

    if not test -d $fisher_path
        functions -e fisher &>/dev/null
        mkdir -p $fisher_path
        touch $__fish_config_dir/fish_plugins
        curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source
        if test -s $__fish_config_dir/fish_plugins
            fisher update
        else
            fisher install jorgebucaran/fisher
        end
    end

    for file in $fisher_path/conf.d/*.fish
        set --local base (path basename -- $file)
        test -f $__fish_config_dir/conf.d/$base; and continue
        test -r $file; and builtin source $file
    end
end
