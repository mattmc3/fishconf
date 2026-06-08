function finit --description 'Run an init step: finit <name> [args...] calls _finit_<name> args'
    set -l fn _finit_$argv[1]
    if not functions -q $fn
        echo "finit: unknown init step: $argv[1]" >&2
        return 1
    end
    $fn $argv[2..]
end
