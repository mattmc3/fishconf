set my_theme nord
if test "$selected_theme" != "$my_theme"
    fish_config theme choose $my_theme
    set -U selected_theme $my_theme
end
