type -q brew || return 1

# Handle brew on multi-user Apple silicon.
set -q HOMEBREW_PREFIX || set -gx HOMEBREW_PREFIX /opt/homebrew
if test -d "$HOMEBREW_PREFIX"
    set -gx HOMEBREW_OWNER (stat -f "%Su" "$HOMEBREW_PREFIX" 2>/dev/null)
end

set -gx HOMEBREW_NO_ANALYTICS 1
