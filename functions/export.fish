function export --description 'Declares a global posix variable like bash'
    if [ (count $argv) -ne 1 ]
        echo "export: usage: export foo=bar" >&2
        return 1
    end
    set -l parts (string split -m 1 -n '=' $argv[1])
    if [ (count $argv) -lt 1 ]
        echo "export: usage: export foo=bar" >&2
        return 1
    end
    set -gx $parts[1] $parts[2]
end
