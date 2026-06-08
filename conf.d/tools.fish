# Shell integrations for external tools (skip any that aren't installed).

# type -q fzf; and fzf --fish | source
type -q fzf; and cachecmd --source fzf --fish

# type -q prj; and prj -i fish | source
type -q prj; and cachecmd --source prj -i fish

# type -q zoxide; and zoxide init fish | source
type -q zoxide; and cachecmd --source zoxide init fish
