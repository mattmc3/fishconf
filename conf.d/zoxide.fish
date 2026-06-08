# Initialize zoxide for fast jumping with 'z'.
type -q zoxide; or return 1
zoxide init fish | source
