function clone --description 'git clone simplified'
    set -q XDG_PROJECTS_DIR; or set XDG_PROJECTS_DIR $HOME/Projects

    if test (count $argv) -lt 1
        echo "clone: Expecting a repo argument" >&2
        return 1
    end

    # arguments for `git clone` are tricky because there's an optional dir at
    # the end (git clone [<options>] [--] <repo> [<dir>]). This means we have
    # to either to some fancy testing of the last two args, or just parse all
    # the options for git clone.
    set -l origargs $argv
    set -l clone_options \
        v/verbose \
        q/quiet \
        progress \
        reject-shallow \
        n/no-checkout \
        bare \
        mirror \
        l/local \
        no-hardlinks \
        s/shared \
        'recurse-submodules=?' \
        'recursive=?' \
        'j/jobs=' \
        'template=' \
        'reference=' \
        'reference-if-able=' \
        dissociate \
        'o/origin=' \
        'b/branch=' \
        'u/upload-pack=' \
        'depth=' \
        'shallow-since=' \
        'shallow-exclude=' \
        single-branch \
        no-tags \
        shallow-submodules \
        'separate-git-dir=' \
        'c/config=' \
        'server-option=' \
        4/ipv4 \
        6/ipv6 \
        'filter=' \
        remote-submodules \
        sparse

    argparse --stop-nonopt --name=(status function) $clone_options -- $argv
    # if parsing was successful and we're only left with <repo> <dir> or <repo>
    if test $status -ne 0 || test (count $argv) -eq 0 || test (count $argv) -gt 2
        echo "clone: Invalid command args. `man git-clone` for proper usage." >&2
        return 1
    end

    # either we have <repo> <dir> or just <repo>
    set -l repo
    set -l repodir
    if test (count $argv) -eq 1
        set repo $origargs[-1]
        set origargs $origargs[1..-2]
    else if test (count $argv) -eq 2
        set repodir $origargs[-1]
        set repo $origargs[-2]
        set origargs $origargs[1..-3]
    end

    if not set -l parsed_repo (parse-giturl $repo)
        echo "clone: Unrecognized repo format: $repo." >&2
        return 1
    end

    if test -z "$repodir"
        set repodir $XDG_PROJECTS_DIR/$parsed_repo[-2]/$parsed_repo[-1]
    end

    if test -d $repodir/.git
        echo "clone: Repo already cloned. Taking you there now..." >&2
    else
        git clone $origargs $parsed_repo[1] $repodir
    end

    # take you to the dir you just cloned
    if test -d $repodir/.git
        echo "Changing dirs from $PWD to $repodir"
        eval (cd $repodir)
    else if test -d $repodir/$parsed_repo[-1]/.git
        echo "Changing dirs from $PWD to $repodir/$parsed_repo[-1]"
        eval (cd $repodir/$parsed_repo[-1])
    end
end
