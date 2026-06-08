# Set editor variables.
set -q PAGER; or set -Ux PAGER less
set -q VISUAL; or set -Ux VISUAL code
set -q EDITOR; or set -Ux EDITOR vim

# Set browser on macOS.
if test "$OSTYPE" = darwin
    set -q BROWSER; or set -Ux BROWSER open
end
