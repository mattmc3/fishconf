# set default location of _Z_DATA
if not set -q _Z_DATA
    if set -q XDG_DATA_HOME
        set -U _Z_DATA "$XDG_DATA_HOME/z/data"
    else
        set -U _Z_DATA "$HOME/.local/share/z/data"
    end
end

if not test -f $_Z_DATA
    set -l zdir (dirname $_Z_DATA)
    test -d $zdir || mkdir -p -m 700 $zdir
    touch $_Z_DATA
end

function __z_on_variable_pwd --on-variable PWD
    status --is-command-substitution && return
    z --add $PWD
end
