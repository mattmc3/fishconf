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
if string match -q 'darwin*' $OSTYPE
    set -q BROWSER || set -Ux BROWSER open
end

# LS_COLORS / EZA_COLORS — basic 8-color ANSI (theme-adaptive, matches zephyr color plugin)
# di=blue ln=magenta ex=red so=green pi=yellow bd=bold-cyan cd=bold-yellow
set -q LS_COLORS || set -gx LS_COLORS \
    "di=34:ln=35:so=32:pi=33:ex=31:bd=1;36:cd=1;33:su=30;41:sg=30;46:tw=30;42:ow=30;43"
# EZA_COLORS extends LS_COLORS with eza-specific keys (permissions, sizes, user/group)
set -q EZA_COLORS || set -gx EZA_COLORS \
    "$LS_COLORS:or=1;31:fi=0:da=2:sn=33:sb=2:uu=33:un=2:gu=35:gn=2:lp=35:\
ur=33:uw=31:ux=32:ue=32:gr=2;33:gw=2;31:gx=2;32:tr=2:tw=2:tx=2:xa=2"

# Other vars
set -q FISH_THEME || set -U FISH_THEME tokyonight_night
