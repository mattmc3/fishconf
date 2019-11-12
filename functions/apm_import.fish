function apm_import --description 'Import packages into Atom via apm'
    if not test -f "$argv"
        echo "Usage: Expecting valid apm file path" >&2
        return
    end
    set -q ATOM_HOME || set -l ATOM_HOME $HOME/.atom
    if not test -d "$ATOM_HOME"
        echo "Cannot find Atom" >&2
        return
    end
    cut -d '@' -f 1 "$argv" | xargs -I % sh -c '[ ! -d "$ATOM_HOME/packages/%" ] && apm install % --compatible || echo "already installed: %"'
end
