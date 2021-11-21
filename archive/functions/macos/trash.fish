function trash -d "Move a specified file to the Trash"
    if test (count $argv) -eq 0
        echo "Usage: trash <list>" >&2
        return 1
    end

    set -l trash_dir "$HOME/.Trash"
    for item in $argv
        if test -e $item
            set -l item_name (basename $item)
            if test -e "$trash_dir/$item_name"
                set -l current_time (date "+%s")
                mv -f "$item" "$trash_dir/$item_name $current_time"
            else
                mv -f "$item" "$trash_dir/"
            end
        end
    end
end
