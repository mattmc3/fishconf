# All variables are universals here. They can be overridden with globals in config.fish

# Colorize man pages.
set -q LESS_TERMCAP_mb || set -Ux LESS_TERMCAP_mb (set_color -o blue)
set -q LESS_TERMCAP_md || set -Ux LESS_TERMCAP_md (set_color -o cyan)
set -q LESS_TERMCAP_me || set -Ux LESS_TERMCAP_me (set_color normal)
set -q LESS_TERMCAP_so || set -Ux LESS_TERMCAP_so (set_color -b white black)
set -q LESS_TERMCAP_se || set -Ux LESS_TERMCAP_se (set_color normal)
set -q LESS_TERMCAP_us || set -Ux LESS_TERMCAP_us (set_color -u magenta)
set -q LESS_TERMCAP_ue || set -Ux LESS_TERMCAP_ue (set_color normal)

# Set editor variables.
set -q PAGER || set -Ux PAGER less
set -q VISUAL || set -Ux VISUAL code
set -q EDITOR || set -Ux EDITOR vim

# Set browser on macOS.
switch (uname -s)
    case Darwin
        set -q BROWSER || set -Ux BROWSER open
end

# Other vars
set -q FISH_THEME || set -U FISH_THEME tokyonight_night
