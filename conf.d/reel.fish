set -q reel_plugins_path || set -g reel_plugins_path $__fish_config_dir/plugins
test -d $reel_plugins_path/reel; \
    or git clone https://github.com/mattmc3/reel $reel_plugins_path/reel
test -f $reel_plugins_path/reel/lib/bootstrap.fish; \
    and source $reel_plugins_path/reel/lib/bootstrap.fish
