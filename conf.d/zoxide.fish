# Initialize zoxide for fast jumping with 'z'.
type -q zoxide || return 1
cachecmd zoxide init fish | source
