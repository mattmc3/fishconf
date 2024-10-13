if not set -q REPO_HOME
    if set -q XDG_CACHE_HOME
        set -gx REPO_HOME $XDG_CACHE_HOME/repos
    else
        set -gx REPO_HOME $HOME/.cache/repos
    end
end

function __repo_update -a repo
    set --local repodir $REPO_HOME/$repo
    set --local oldsha (command git -C $repodir rev-parse --short HEAD)
    command git -C $repodir pull --quiet --ff --depth 1 --rebase --autostash
    set --local newsha (command git -C $repodir rev-parse --short HEAD)
    if test $oldsha != $newsha
        echo "$repo updated: "(path basename $repodir)" ($oldsha->$newsha)"
    else
        echo "$repo... no updates."
    end
end

function repo -a cmd --description "Deal with git repos"
    # repo main function
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
            echo $REPO_HOME
        case ls
            for repodir in (path dirname $REPO_HOME/*/*/.git)
                echo (path basename (path dirname $repodir))"/"(path basename $repodir)
            end
        case up update
            echo "Checking for updates..."
            for repo in (repo ls)
                __repo_update $repo
            end
            wait
            echo "Update complete."
        case rm
            set err 0
            for repo in $argv
                if not string match --quiet "$HOME/*" "$REPO_HOME"
                    echo "repo home not set correctly '$REPO_HOME'." >&2
                    return 1
                else if [ -d $REPO_HOME/$repo ]
                    command rm -rf -- $REPO_HOME/$repo
                else
                    echo "Repo not found '$repo'."
                    set err 1
                end
            end
            return $err
        case in
            set err 1
            for repo in $argv
                set --local plugindir $REPO_HOME/$repo
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
            echo >&2 "repo: unknown command '"$cmd"'"
            return 1
    end
end
