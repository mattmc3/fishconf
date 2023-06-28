function g.statusall -a dir -d 'git status of all git subdirs'
    if test -z $dir
        set dir .
    end
    set dir (realpath $dir)
    for gitdir in $dir/**/.git
        set prjdir (path dirname $gitdir)
        echo "$prjdir status..."
        git -C "$prjdir" status -sb
    end
end
