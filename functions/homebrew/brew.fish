type -q brew || return 1
set -q HOMEBREW_PREFIX || set HOMEBREW_PREFIX /opt/homebrew
set -gx HOMEBREW_OWNER (stat -f "%Su" $HOMEBREW_PREFIX)
if test $HOMEBREW_OWNER = (whoami)
    return
end

function brew --description 'Wrap brew with sudo for multi-user systems'
    sudo -Hu $HOMEBREW_OWNER brew $argv
end
