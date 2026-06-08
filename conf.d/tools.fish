# Shell integrations for external tools (skip any that aren't installed).
type -q direnv; and direnv hook fish | source
type -q fzf; and fzf --fish | source
type -q prj; and prj -i fish | source
type -q zoxide; and zoxide init fish | source
