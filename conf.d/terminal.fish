#
# Terminal
#

switch (string lower $TERM_PROGRAM)
    case wezterm
        set_term_var TERM_CURRENT_SHELL "fish $FISH_VERSION"
    case vscode
        if type -q code
            set -l _vscode_shell_int (code --locate-shell-integration-path fish 2>/dev/null)
            test -f "$_vscode_shell_int"; and source "$_vscode_shell_int"
        end
end
