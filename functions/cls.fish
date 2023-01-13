function cls -d 'Clear screen and stop scroll back'
    clear && printf '\e[3J'
end
