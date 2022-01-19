# Defined via `source`
function te --wraps='$EDITOR .' --description 'alias te $EDITOR .'
    $EDITOR . $argv
end
