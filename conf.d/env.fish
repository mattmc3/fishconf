# All variables are universals here. They can be overridden with globals in config.fish

# Colorize man pages.
set -q LESS_TERMCAP_mb; or set -Ux LESS_TERMCAP_mb (set_color -o blue)
set -q LESS_TERMCAP_md; or set -Ux LESS_TERMCAP_md (set_color -o cyan)
set -q LESS_TERMCAP_me; or set -Ux LESS_TERMCAP_me (set_color normal)
set -q LESS_TERMCAP_so; or set -Ux LESS_TERMCAP_so (set_color -b white black)
set -q LESS_TERMCAP_se; or set -Ux LESS_TERMCAP_se (set_color normal)
set -q LESS_TERMCAP_us; or set -Ux LESS_TERMCAP_us (set_color -u magenta)
set -q LESS_TERMCAP_ue; or set -Ux LESS_TERMCAP_ue (set_color normal)

# Set editor variables.
set -q PAGER; or set -Ux PAGER less
set -q VISUAL; or set -Ux VISUAL code
set -q EDITOR; or set -Ux EDITOR vim

# Set browser on macOS.
switch (uname -s)
    case Darwin
        set -q BROWSER; or set -Ux BROWSER open
end

# XDG apps
set -q GNUPGHOME; or set -Ux GNUPGHOME $XDG_DATA_HOME/gnupg
set -q LESSHISTFILE; or set -Ux LESSHISTFILE $XDG_DATA_HOME/lesshst
set -q SQLITE_HISTORY; or set -Ux SQLITE_HISTORY $XDG_DATA_HOME/sqlite_history
set -q WORKON_HOME; or set -Ux WORKON_HOME $XDG_DATA_HOME/venvs
set -q PYLINTHOME; or set -Ux PYLINTHOME $XDG_CACHE_HOME/pylint

# Other vars
set -q FISH_THEME; or set -U FISH_THEME tokyonight_night
