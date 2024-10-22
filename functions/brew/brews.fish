function brews -d "Show brewed formulae"
    set -l formulae (brew leaves | xargs brew deps --installed --for-each)
    set -l casks (brew list --cask 2>/dev/null)

    echo (set_color blue)"==>"(set_color --bold normal)" Formulae"(set_color normal)
    string replace -r '^(.*):(.*)$' '$1'(set_color blue)'$2'(set_color normal) $formulae
    echo
    echo (set_color blue)"==>"(set_color --bold normal)" Casks"(set_color normal)
    printf '%s\n' $casks
end
