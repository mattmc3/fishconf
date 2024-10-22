function __fish_jupyter_subcommands
    if type -q -f jupyter
        jupyter -h | tr ' ' '\n' | sed -e '1,/subcommands\:/d'
    end
end

complete -x -c jupyter -a "(__fish_jupyter_subcommands)"

complete -f -c jupyter -s h -l help -d "Show help message and exit"
complete -f -c jupyter -l version -d "Show the jupyter command's version and exit"
complete -f -c jupyter -l config-dir -d "Show Jupyter config dir"
complete -f -c jupyter -l data-dir -d "Show Jupyter data dir"
complete -f -c jupyter -l runtime-dir -d "Show Jupyter runtime dir"
complete -f -c jupyter -l paths -d "Show all Jupyter paths. Add --json for machine-readable format."
complete -f -c jupyter -l json -d "Output paths as machine-readable json."
