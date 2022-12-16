function prettify --description "Fish prettify"
    fish_indent -w (string match --invert --entire $__fish_config_dir/fisher $__fish_config_dir/**/*.fish)
end
