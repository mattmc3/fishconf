# Initialize fuzzy finder.
type -q fzf || return 1
fzf --fish | source
