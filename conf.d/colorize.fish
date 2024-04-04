# Colorize man pages.
set -gx LESS_TERMCAP_mb (set_color -o blue)
set -gx LESS_TERMCAP_md (set_color -o cyan)
set -gx LESS_TERMCAP_me (set_color normal)
set -gx LESS_TERMCAP_so (set_color -b white black)
set -gx LESS_TERMCAP_se (set_color normal)
set -gx LESS_TERMCAP_us (set_color -u magenta)
set -gx LESS_TERMCAP_ue (set_color normal)
