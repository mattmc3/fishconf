function cdpr \
    --description "cd to the project root"

    if ! git rev-parse --is-inside-work-tree &>/dev/null
        echo "cdpr: Cannot cd to project root. \$PWD not in a git project."
    end
    cd (git rev-parse --show-toplevel)
end
