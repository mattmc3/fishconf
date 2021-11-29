# ### modules
# # set modules (string match --invert -r '^(\#.*)?$' <$__fish_config_dir/fish_modules)

# set -l module_repos \
#        mattmc3/hydro \
#        mattmc3/iwd.fish \
#        mattmc3/macos.fish \
#        mattmc3/magic-enter.fish \
#        mattmc3/up.fish \
#        jethrokuan/z \
#        laughedelic/fish_logo

# set -l module_names (string replace -r '^.+\/([^\/]+)$' '\$1' $module_repos |
#                      string replace -r '\.fish$' '')

# # clone modules if necessary
# for i in (seq (count $module_repos))
#     set -l repo $module_repos[$i]
#     set -l module_name $module_names[$i]
#     set -l module_dir $__fish_config_dir/modules/$module_name

#     if not test -d $module_dir
#         command git clone --depth 1 --recursive --shallow-submodules git@github.com:$repo $module_dir
#         if test $status -ne 0
#             echo "git clone failed for: $repo" >&2
#             continue
#         end
#     end
# end

# # load modules
# set fish_complete_path $fish_complete_path[1] $__fish_config_dir/modules/*/completions $fish_complete_path[2..-1]
# set fish_function_path $fish_function_path[1] $__fish_config_dir/modules/*/functions $fish_function_path[2..-1]
# for confd in $__fish_config_dir/modules/*/conf.d/*.fish
#     builtin source "$confd"
# end
