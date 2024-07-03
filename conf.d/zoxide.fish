# Initialize zoxide for fast jumping with 'z'.
type -q zoxide || return 1
zoxide init fish | source
