function colorscheme_tokyo_night
    echo "color scheme: tokyo night"
    set -U colorscheme tokyo_night

    # Tokyo Night Color Palette
    set -l foreground c0caf5
    set -l selection 33467C
    set -l comment 565f89
    set -l red f7768e
    set -l orange ff9e64
    set -l yellow e0af68
    set -l green 9ece6a
    set -l purple 9d7cd8
    set -l cyan 7dcfff
    set -l pink bb9af7

    # Syntax Highlighting Colors
    set -U fish_color_normal $foreground
    set -U fish_color_command $cyan
    set -U fish_color_keyword $pink
    set -U fish_color_quote $yellow
    set -U fish_color_redirection $foreground
    set -U fish_color_end $orange
    set -U fish_color_error $red
    set -U fish_color_param $purple
    set -U fish_color_comment $comment
    set -U fish_color_selection --background=$selection
    set -U fish_color_search_match --background=$selection
    set -U fish_color_operator $green
    set -U fish_color_escape $pink
    set -U fish_color_autosuggestion $comment

    # Completion Pager Colors
    set -U fish_pager_color_progress $comment
    set -U fish_pager_color_prefix $cyan
    set -U fish_pager_color_completion $foreground
    set -U fish_pager_color_description $comment
end
