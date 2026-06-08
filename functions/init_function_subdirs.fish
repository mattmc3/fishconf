function init_function_subdirs --description 'Autoload functions from functions/ subdirs (eg functions/python/)'
    set fish_function_path (path resolve $__fish_config_dir/functions/*/) $fish_function_path
end
