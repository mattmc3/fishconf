function gacp --description 'git add/commit/push all-in-one'
    set curbranch (git rev-parse --abbrev-ref HEAD)
    if test $status -ne 0
        echo "gacp: Not in a git repo" >&2
        return 1
    end
    if test (count $argv) -lt 1
        echo "gacp: Expecting commit message" >&2
        return 1
    end
    if test "$curbranch" = "master"
        while true
            read -l -P "You are about to add/commit/push to master. Are you sure? [y/n] " confirm
            switch $confirm
                case Y y
                    break
                case '' N n
                    return 1
            end
        end
    end

    git add .
    git commit -am "$argv"
    git push
end
