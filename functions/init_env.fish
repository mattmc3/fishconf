# Like bash/zsh profile - set env
function init_env --description 'Set up common environment variable defaults'
    # These are universals so they can be overridden with globals

    # Editors / pager.
    set -q PAGER; or set -Ux PAGER less
    set -q VISUAL; or set -Ux VISUAL code
    set -q EDITOR; or set -Ux EDITOR vim

    # Browser on macOS.
    if test "$OSTYPE" = darwin
        set -q BROWSER; or set -Ux BROWSER open
    end

    # Colorize man pages (via less).
    set -q LESS_TERMCAP_mb; or set -Ux LESS_TERMCAP_mb (set_color -o blue)
    set -q LESS_TERMCAP_md; or set -Ux LESS_TERMCAP_md (set_color -o cyan)
    set -q LESS_TERMCAP_me; or set -Ux LESS_TERMCAP_me (set_color normal)
    set -q LESS_TERMCAP_so; or set -Ux LESS_TERMCAP_so (set_color -b white black)
    set -q LESS_TERMCAP_se; or set -Ux LESS_TERMCAP_se (set_color normal)
    set -q LESS_TERMCAP_us; or set -Ux LESS_TERMCAP_us (set_color -u magenta)
    set -q LESS_TERMCAP_ue; or set -Ux LESS_TERMCAP_ue (set_color normal)

    # LS_COLORS / EZA_COLORS — basic 8-color ANSI (theme-adaptive).
    set -q LS_COLORS; or set -Ux LS_COLORS \
        "di=34:ln=35:so=32:pi=33:ex=31:bd=1;36:cd=1;33:su=30;41:sg=30;46:tw=30;42:ow=30;43"
    set -q EZA_COLORS; or set -Ux EZA_COLORS \
        "$LS_COLORS:or=1;31:fi=0:da=2:sn=33:sb=2:uu=33:un=2:gu=35:gn=2:lp=35:\
    ur=33:uw=31:ux=32:ue=32:gr=2;33:gw=2;31:gx=2;32:tr=2:tx=2:xa=2"
end
