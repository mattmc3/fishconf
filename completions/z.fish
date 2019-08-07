function z.complete
    z -l $argv | awk '{print $2}' | uniq
end

complete -c z -s c -d "Restrict matches to subdirectories of the current directory"
complete -c z -s e -d "Echo the best match, don't cd"
complete -c z -s h -d "Show a brief help message"
complete -c z -s l -d "List only"
complete -c z -s r -d "Match by rank only"
complete -c z -s t -d "Match by recent access only"
complete -c z -s x -d "Remove the current directory from the datafile"

complete -c z --no-files -a '(z.complete)'
