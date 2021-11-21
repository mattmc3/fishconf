# set plugins \
#     mattmc3/xdg-basedir.fish \
#     mattmc3/macos.fish \
#     mattmc3/up.fish \
#     mattmc3/iwd.fish \
#     mattmc3/magic-enter.fish \
#     decors/fish-colored-man \
#     decors/fish-lscolors \
#     jethrokuan/z \
#     fishingline/gitdot \
#     fishingline/python \
#     fishingline/safe-rm \
#     laughedelic/fish_logo

set plugins (cat $__fish_config_dir/fish_plugins)
for repo in $plugins
    plugin-clone "https://github.com/$repo"
    set plugin_name (string split / --max 1 --fields 2 --right $repo)
    plugin-load $__fish_config_dir/plugins/$plugin_name
end
