# Replace bash terminations with Fish ones
abbr -a --position command -- fi end
abbr -a --position command -- done end

# Replace [[ ]] with [ ]
function _transform_double_bracket --on-event preexecute
    set cmd (string replace --regex '\[\[(.*)\]\]' '[$1]' $argv)
    commandline -- $cmd
end

function _transform_var_assignment --on-event preexecute
    set cmd $argv
    # Only transform if the entire line is assignments (no command following)
    if string match --quiet --regex --ignore-case '^([A-Z_][A-Z0-9_]*=\S+\s*)+$' $cmd
        set cmd (string replace --regex --all --ignore-case '([A-Z_][A-Z0-9_]*)=(\S+)' 'set $1 $2' $cmd)
    end
    commandline -- $cmd
end

# This allow us to handle multiple revisions via a preexecute event
function _preprocess_commandline
    emit preexecute (commandline)
    commandline -f execute
end

bind \n _preprocess_commandline
bind \r _preprocess_commandline
