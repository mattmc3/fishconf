function isint
    [ "$argv" -eq "$argv" ] 2>/dev/null; and return 0; or return 1
end
