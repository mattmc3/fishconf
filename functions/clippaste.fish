# ported to fish from https://github.com/robbyrussell/oh-my-zsh/blob/master/lib/clipboard.zsh
# clippaste - "Paste" data from clipboard to stdout
#
# Usage:
#
#   clippaste   - writes clipboard's contents to stdout
#
#   clippaste | <command>    - pastes contents and pipes it to another process
#
#   clippaste > <file>      - paste contents to a file
#
# Examples:
#
#   # Pipe to another process
#   clippaste | grep foo
#
#   # Paste to a file
#   clippaste > file.txt
function clippaste
    set ostype (string lower (uname))
    switch $ostype
        case 'darwin*'
            pbpaste
        case 'cygwin*'
            cat /dev/clipboard
        case '*'
            if type -q xclip
                xclip -out -selection clipboard
            else if type -q xsel
                xsel --clipboard --output
            else
                print "clippaste: Platform $ostype not supported or xclip/xsel not installed" >&2
                return 1
            end
    end
end
