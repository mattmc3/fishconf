function man --wraps man --description 'Format and display manual pages'
    set -q LESS_TERMCAP_mb || set -lx LESS_TERMCAP_mb (set_color -o blue)
    set -q LESS_TERMCAP_md || set -lx LESS_TERMCAP_md (set_color -o cyan)
    set -q LESS_TERMCAP_me || set -lx LESS_TERMCAP_me (set_color normal)
    set -q LESS_TERMCAP_so || set -lx LESS_TERMCAP_so (set_color -b white black)
    set -q LESS_TERMCAP_se || set -lx LESS_TERMCAP_se (set_color normal)
    set -q LESS_TERMCAP_us || set -lx LESS_TERMCAP_us (set_color -u magenta)
    set -q LESS_TERMCAP_ue || set -lx LESS_TERMCAP_ue (set_color normal)
    set -q LESS || set -lx LESS '-R -s'

    set -lx GROFF_NO_SGR yes # fedora

    # Man pages paths
    set -lx MANPATH (command manpath)
    set -q MANPATH || set -lx MANPATH ''
    for mpath in \
        /opt/homebrew/share/man \
        /usr/local/share/man \
        /usr/share/man \
        $__fish_data_dir/man \
        $HOMEBREW_PREFIX/opt/curl/share/man \
        $HOMEBREW_PREFIX/opt/ruby/share/man

        test -d $mpath && set -x MANPATH $MANPATH $mpath
    end
    command man $argv
end
