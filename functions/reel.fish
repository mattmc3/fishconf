set -q REEL_HOME || set -gx REEL_HOME $XDG_DATA_HOME/reel

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

    # piped/redirected input
    if not test -t 0
        while read -l line
            set line (string replace -r '#.*$' "" $line | string trim)
            if [ $line != "" ]
                set argv $argv $line
            end
        end
    end

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
            set err 0
            for repo in $argv
                if not string match --quiet "$HOME/*" "$REEL_HOME"
                    echo "Reel home not set correctly '$REEL_HOME'." >&2
                    return 1
                else if [ -d $REEL_HOME/$repo ]
                    command rm -rf -- $REEL_HOME/$repo
                else
                    echo "Repo not found '$repo'."
                    set err 1
                end
            end
            return $err
        case in
            set err 1
            for repo in $argv
                set -l plugindir $REEL_HOME/$repo
                if not test -d $plugindir
                    echo "Cloning $repo..."
                    command git clone --quiet --depth 1 --recursive --shallow-submodules \
                        https://github.com/$repo $plugindir &
                    set err 0
                end
            end
            wait
            return $err
        case \*
            echo >&2 "reel: unknown command '"$cmd"'"
            return 1
    end
end
