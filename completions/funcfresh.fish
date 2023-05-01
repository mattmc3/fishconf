function __funcfresh_list_all_functions
    # if the current commandline token starts with _, list all functions
    if string match --quiet --regex -- '^_' (commandline --cut-at-cursor --current-token)
        functions --names --all
    else
        functions --names
    end
end

complete --exclusive --command funcfresh --arguments "(__funcfresh_list_all_functions)"
