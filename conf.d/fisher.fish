# ### fisher
# # https://github.com/jorgebucaran/fisher#changing-the-installation-prefix
# # https://github.com/kidonng/fisher_path.fish
# set -g fisher_path $__fish_config_dir/fisher

# set fish_function_path $fish_function_path[1] $fisher_path/functions $fish_function_path[2..-1]
# set fish_complete_path $fish_complete_path[1] $fisher_path/completions $fish_complete_path[2..-1]

# if not test -d $fisher_path
#     git clone --depth 1 https://github.com/jorgebucaran/fisher.git $fisher_path
#     fisher update
# end

# for file in $fisher_path/conf.d/*.fish
#     builtin source $file 2>/dev/null
# end
