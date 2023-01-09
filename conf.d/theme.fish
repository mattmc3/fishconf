set my_theme tokyo_night
if test "$selected_theme" != "$my_theme"
    fish_config theme choose $my_theme
    set -Ux selected_theme $my_theme
end
