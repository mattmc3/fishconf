function allexts --description "Show all extentions in a project"
    find . -not \( -wholename './.git' -prune \) -type f -name '*.*' | sed 's|.*\.|\.|' | sort | uniq -c
end
