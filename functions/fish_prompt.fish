# Defined in /usr/local/Cellar/fish/3.0.2/share/fish/functions/fish_prompt.fish @ line 5
function fish_prompt --description 'Write out the prompt'
    set -l color_cwd
    set -l prefix
    set -l suffix
    switch "$USER"
        case root toor
            if set -q fish_color_cwd_root
                set color_cwd $fish_color_cwd_root
            else
                set color_cwd $fish_color_cwd
            end
            set suffix '#'
        case '*'
            set color_cwd $fish_color_cwd
            # fishes: '❯❮))❯' ' ><>' ' ⋊>' '⧕❯' '⮀' '⧕▶' ◗
            set suffix '>'
            set prefix '>'
    end

    echo -n -s "$prefix" (set_color $color_cwd) (prompt_pwd) (set_color normal) "$suffix "
    # echo -n -s "$USER" @ (prompt_hostname) ' ' (set_color $color_cwd) (prompt_pwd) (set_color normal) "$suffix "
end
