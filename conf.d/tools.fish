# Shell integrations for external tools (skip any that aren't installed).
# type -q direnv; and direnv hook fish | source
type -q direnv; and cachecmd direnv hook fish | source

# type -q fzf; and fzf --fish | source
type -q fzf; and cachecmd fzf --fish | source

# type -q prj; and prj -i fish | source
type -q prj; and cachecmd prj -i fish | source

# type -q zoxide; and zoxide init fish | source
type -q zoxide; and cachecmd zoxide init fish | source
