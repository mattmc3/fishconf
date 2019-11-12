function noext --description "Find files with no file extension"
    # for fun, rename with: noext -exec mv '{}' '{}.sql' \;
    find . -not \( -wholename './.git' -prune \) -type f ! -name '*.*' $argv
end
