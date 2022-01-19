### fisher
# https://github.com/jorgebucaran/fisher#changing-the-installation-prefix
# https://github.com/kidonng/fisher_path.fish
set -q _fisher_initialized && exit || set -g _fisher_initialized true
set -q fisher_path || set -g fisher_path $__fish_config_dir/fisher

if not test -d $fisher_path
    git clone --depth 1 https://github.com/jorgebucaran/fisher.git $fisher_path
    fisher update
end

set fish_function_path $fish_function_path[1] $fisher_path/functions $fish_function_path[2..]
set fish_complete_path $fish_complete_path[1] $fisher_path/completions $fish_complete_path[2..]

# for file in $fisher_path/conf.d/*.fish
#     if ! test -f (string replace -r "^.*/" $__fish_config_dir/conf.d/ -- $file)
#         and test -f $file && test -r $file
#         source $file
#     end
# end

for file in $fisher_path/conf.d/*.fish
    builtin source $file 2>/dev/null
end
