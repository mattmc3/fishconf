function fix_equals_assignment --on-event fish_postexec
    if test $status = 123
        set --local cmdfix (string replace -ra '\b(\w+)=(\w+)\b' 'set $1 $2' "$argv")
        commandline -r $cmdfix
        commandline -f suppress-autosuggestion
        return 123
    end
end
