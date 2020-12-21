# ported to fish from https://github.com/robbyrussell/oh-my-zsh/blob/master/lib/clipboard.zsh
# System clipboard integration
#
# This file has support for doing system clipboard copy and paste operations
# from the command line in a generic cross-platform fashion.
#
# On OS X and Windows, the main system clipboard or "pasteboard" is used. On other
# Unix-like OSes, this considers the X Windows CLIPBOARD selection to be the
# "system clipboard", and the X Windows `xclip` command must be installed.

# clipcopy - Copy data to clipboard
#
# Usage:
#
#  <command> | clipcopy    - copies stdin to clipboard
#
#  clipcopy <file>         - copies a file's contents to clipboard
#
function clipcopy
    set -l file $argv[1]
    set ostype (string lower (uname))
    switch $ostype
        case 'darwin*'
            if test -z $file
                pbcopy
            else
                cat $file | pbcopy
            end
        case 'cygwin*'
            if test -z $file
                cat >/dev/clipboard
            else
                cat $file >/dev/clipboard
            end
        case '*'
            if type -q xclip
                if test -z $file
                    xclip -in -selection clipboard
                else
                    xclip -in -selection clipboard $file
                end
            else if type -q xsel
                if test -z $file
                    xsel --clipboard --input
                else
                    cat "$file" | xsel --clipboard --input
                end
            else
                print "clipcopy: Platform $ostype not supported or xclip/xsel not installed" >&2
                return 1
            end
    end
end
