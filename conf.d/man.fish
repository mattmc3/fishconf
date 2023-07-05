# Colorize man pages.

# mb - blink
set -gx LESS_TERMCAP_mb (set_color -o cyan)
# md - bold
set -gx LESS_TERMCAP_md (set_color -o cyan)
# me - end
set -gx LESS_TERMCAP_me (set_color normal)
# so/se - standout
set -gx LESS_TERMCAP_so (set_color -b white black)
set -gx LESS_TERMCAP_se (set_color normal)
# us/ue - underline
set -gx LESS_TERMCAP_us (set_color -u magenta)
set -gx LESS_TERMCAP_ue (set_color normal)
