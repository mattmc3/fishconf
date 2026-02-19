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
            source_cache vscode_init.fish fish -c \
                'set -l p (code --locate-shell-integration-path fish 2>/dev/null)
                test -f $p || exit 1
                printf "source %s\n" $p'
        end
    case wezterm
        set_term_var TERM_CURRENT_SHELL "fish $FISH_VERSION"
end
