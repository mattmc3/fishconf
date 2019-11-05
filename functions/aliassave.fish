function aliassave --description 'Save the current definition of all specified aliases to file'
    set -l aliasdir ~/.config/fish/aliases
    mkdir -p $aliasdir

    set -l aliases (alias | awk '{print $2}')
    set -l oldaliases ~/.config/fish/aliases/*.fish

    # clear prior aliases
    for f in $oldaliases
        rm $f
    end

    # save new aliases
    for a in $aliases
        functions $a > $aliasdir/"$a".fish

        # could use fish_indent, but I only care about tabs
        # fish_indent -w $aliasdir/"$a".fish

        # replace tab with 4 spaces
        sed -i '' -E "s/"\t"/    /g" $aliasdir/"$a".fish
    end
end
