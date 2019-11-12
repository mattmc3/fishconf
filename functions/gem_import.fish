function gem_import --description 'Import ruby gem file'
    if not test -f "$argv"
        echo "Usage: Expecting valid gems file path" >&2
        return
    end
    awk '{ print $1 }' "$argv" | xargs gem install --conservative
end
