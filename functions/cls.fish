function cls --description 'Clear screen and stop scroll back'
    clear; and printf '\e[3J'
end
