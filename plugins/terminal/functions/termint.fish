function termint --description 'Initialize terminal integration for the current terminal'
    set -q argv[1]; or return 1
    set --local term (string lower -- $argv[1])

    switch $term
        case apple_terminal
            set -gx SHELL_SESSIONS_DISABLE 1
        case ghostty
            set -q GHOSTTY_RESOURCES_DIR; or return 1
            set --local integration_file $GHOSTTY_RESOURCES_DIR/shell-integration/fish/ghostty-integration.fish
            test -r "$integration_file"; or return 1
            source "$integration_file"
        case vscode
            type -q code; or return 1
            set --local integration_file (code --locate-shell-integration-path fish 2>/dev/null)
            test -f "$integration_file"; or return 1
            source "$integration_file"
        case wezterm
            set_term_var TERM_CURRENT_SHELL "fish $FISH_VERSION"
        case '*'
            return 1
    end
end
