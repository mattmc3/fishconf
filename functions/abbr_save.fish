function abbr_save --description 'Save the current definition of all specified abbreviations to file'
    set -l abbr_init $HOME/.config/fish/functions/abbr_init.fish
    echo "function abbr_init --description 'Initializes abbreviations'" > "$abbr_init"
    abbr >> "$abbr_init"
    echo "end" >> "$abbr_init"
    fish_indent -w "$abbr_init"
end
