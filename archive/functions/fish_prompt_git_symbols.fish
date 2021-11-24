function fish_prompt_git_symbols
    set_color normal
    echo (set_color brmagenta)'Ahead ⬆'
    echo (set_color brmagenta)'Behind ⬇'
    echo (set_color cyan)'Stashed ✭'
    echo (set_color green)'Added ✚'
    echo (set_color red)'Deleted ✖'
    echo (set_color blue)'Modified ✱'
    echo (set_color magenta)'Renamed ➜'
    echo (set_color yellow)'Unmerged ═'
    echo (set_color white)'Untracked ◼'
    set_color normal
end
