function alacritty_colorsheme \
    --description "Get color scheme from Alacritty YAML config" \
    --argument-names ymlfile

    if not type -q yq
        echo >&2 "Required tool 'yq' not found. see https://github.com/mikefarah/yq."
        return 1
    end
    if not test -e "$ymlfile"
        echo >&2 "File not found '$ymlfile'."
        return 1
    end

    # turn yaml into fish set var statements and eval
    set --local code (
        yq -o=props $ymlfile |
            string match -rev '^\#' |
            string replace -r '^' 'set ' |
            string replace -a '.' '_' |
            string replace -r '= (#|0x)' ''
    )
    eval (string join ';' $code)

    printf '%s\n' \
        "$colors_normal_black" \
        "$colors_normal_red" \
        "$colors_normal_green" \
        "$colors_normal_yellow" \
        "$colors_normal_blue" \
        "$colors_normal_magenta" \
        "$colors_normal_cyan" \
        "$colors_normal_white" \
        "$colors_bright_black" \
        "$colors_bright_red" \
        "$colors_bright_green" \
        "$colors_bright_yellow" \
        "$colors_bright_blue" \
        "$colors_bright_magenta" \
        "$colors_bright_cyan" \
        "$colors_bright_white"
    # generate_theme \
    #     (path change-extension '' $ymlfile | path basename) \
    #     $colors_primary_background $colors_normal_blue $colors_normal_magenta \
    #     $colors_bright_yellow $colors_normal_yellow $colors_normal_white \
    #     $colors_normal_red $colors_bright_black $colors_bright_black
    # generate_theme \
    #     (path change-extension '' $ymlfile | path basename) \
    #     $colors_primary_background $colors_normal_magenta $colors_normal_blue \
    #     $colors_normal_magenta $colors_normal_green $colors_normal_cyan \
    #     $colors_normal_red $colors_normal_yellow $colors_normal_cyan
end
