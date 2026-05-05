#
# Terminal
#

switch (string lower $TERM_PROGRAM)
    case apple_terminal
        set -gx SHELL_SESSIONS_DISABLE 1
    case ghostty
        if set -q GHOSTTY_RESOURCES_DIR
            set -l _ghostty_int $GHOSTTY_RESOURCES_DIR/shell-integration/fish/ghostty-integration.fish
            test -r "$_ghostty_int" && source "$_ghostty_int"
        end
    case vscode
        if type -q code
            set -l shell_integration (code --locate-shell-integration-path fish 2>/dev/null)
            test -f $shell_integration || return 1
            source $shell_integration
        end
    case wezterm
        set_term_var TERM_CURRENT_SHELL "fish $FISH_VERSION"
end
