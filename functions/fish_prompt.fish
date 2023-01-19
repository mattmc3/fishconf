function fish_prompt --description Hydro
    if set -q _hydro_pwd
        echo -e "\n$_hydro_color_pwd$_hydro_pwd\x1b[0m $_hydro_color_git$$_hydro_git\x1b[0m$_hydro_color_duration$_hydro_cmd_duration\x1b[0m$$_hydro_addons$_hydro_status\x1b[0m "
    else
        set -l default_prompt_files \
            /opt/homebrew/Cellar/fish/*/share/fish/functions/fish_prompt.fish \
            /usr/local/Cellar/fish/*/share/fish/functions/fish_prompt.fish
        for prompt in $default_prompt_files
            test -f $prompt && source $prompt && return
        end
    end
end
