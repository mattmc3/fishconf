### modules
# modules are plugins I develop locally, and want to give fisher access to without
# having to commit to the remote every time

set -l modules (string match --invert -r '^(\#.*)?$' <$__fish_config_dir/fish_modules)
set -l module_names (string replace -r '^.+\/([^\/]+)$' '\$1' $modules |
                     string replace -r '\.fish$' '')
# clone modules if necessary
set cloned false
for i in (seq (count $modules))
    set -l repo $modules[$i]
    set -l dest $__fish_config_dir/modules/$module_names[$i]
    if not test -d $dest
        command git clone --depth 1 --recursive --shallow-submodules git@github.com:$repo $dest
        if test $status -ne 0
            echo "git clone failed for: $repo" >&2
            continue
        else
            set cloned true
        end
    end
end

### fisher
# https://github.com/jorgebucaran/fisher#changing-the-installation-prefix
# https://github.com/kidonng/fisher_path.fish
set -g fisher_path $__fish_config_dir/fisher

set fish_function_path $fish_function_path[1] $fisher_path/functions $fish_function_path[2..]
set fish_complete_path $fish_complete_path[1] $fisher_path/completions $fish_complete_path[2..]

if not test -d $fisher_path
    git clone --depth 1 https://github.com/jorgebucaran/fisher.git $fisher_path
    set cloned true
end

test $cloned = true && fisher update

for file in $fisher_path/conf.d/*.fish
    builtin source $file 2>/dev/null
end
