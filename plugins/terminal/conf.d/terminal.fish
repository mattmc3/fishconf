#
# Terminal
#

# Opt in with values like: ghostty vscode wezterm apple_terminal iterm2
set -q TERMINAL_INTEGRATIONS; or set -g TERMINAL_INTEGRATIONS

set -q SHELL_SESSIONS_DISABLE; or set -gx SHELL_SESSIONS_DISABLE 1

if test -n "$TERM_PROGRAM"; and contains -- $TERM_PROGRAM $TERMINAL_INTEGRATIONS
    termint $TERM_PROGRAM
end
