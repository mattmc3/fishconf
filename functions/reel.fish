set -q XDG_DATA_HOME || set -Ux XDG_DATA_HOME $HOME/.local/share
set -q REEL_HOME || set -Ux REEL_HOME $XDG_DATA_HOME/reel

function __reel_update -a repo
    set -l repodir $REEL_HOME/$repo
    set -l oldsha (command git -C $repodir rev-parse --short HEAD)
    command git -C $repodir pull --quiet --ff --depth 1 --rebase --autostash
    set -l newsha (command git -C $repodir rev-parse --short HEAD)
    if test $oldsha != $newsha
        echo "Repo updated: "(path basename $repodir)" ($oldsha->$newsha)"
    end
end

function reel -a cmd --description "Deal with repos"
    # reel main function
    set argv $argv[2..-1]
    switch "$cmd"
        case home
            echo $REEL_HOME
        case ls
            for repodir in (path dirname $REEL_HOME/*/*/.git)
                echo (path basename (path dirname $repodir))"/"(path basename $repodir)
            end
        case up
            echo "Checking for updates..."
            for repo in (reel ls)
                echo "$repo..."
                __reel_update $repo &
            end
            wait
            echo "Update complete."
        case rm
            if not string match --quiet "$HOME/*" "$REEL_HOME"
                echo "Reel home not set correctly '$REEL_HOME'." >&2
                return 1
            else if test -d $REEL_HOME/$argv
                command rm -rf -- $REEL_HOME/$argv
            else
                echo "Repo not found '$argv'."
            end
        case in
            set --local plugin
            for repo in $argv
                set -l plugindir $REEL_HOME/$repo
                if not test -d $plugindir
                    echo "Cloning $repo..."
                    command git clone --quiet --depth 1 --recursive --shallow-submodules \
                        https://github.com/$repo $plugindir &
                end
            end
            wait
        case \*
            echo >&2 "reel: unknown command '"$cmd"'"
            return 1
    end
end
