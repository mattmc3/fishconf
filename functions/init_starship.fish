function init_starship
    set -q STARSHIP_CONFIG || set -Ux STARSHIP_CONFIG $__fish_config_dir/themes/mmc.toml
    starship init fish | source
    enable_transience
end
