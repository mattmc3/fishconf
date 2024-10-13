function fish_prettify --description 'prettify all fish config files'
    set --local fish_files $__fish_config_dir/**/*.fish
    # filter fisher files
    set fish_files (string match --invert --entire $__fish_config_dir/fisher $fish_files)
    fish_indent -w $fish_files
end
