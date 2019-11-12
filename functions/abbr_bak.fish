function abbr_bak --description 'Back up abbreviations to dotfiles'
    set abbrbak "$DOTFILES"/_bak/abbr_(date +"%Y%m%d_%H%M%S")
    mkdir -p $abbrbak
    abbr -s >"$abbrbak"/abbr.fish
    echo "Fish abbreviations backup created: $abbrbak/abbr.fish"
end
