function git_branch_name -d "Get current branch name"
    git_is_repo && begin
        command git symbolic-ref --short HEAD 2>/dev/null
        || command git show-ref --head -s --abbrev | head -n1 2>/dev/null
    end
end
