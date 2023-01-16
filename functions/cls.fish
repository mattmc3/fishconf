function cls --description 'Clear screen and stop scroll back'
    clear && printf '\e[3J'
end
