function z -d "jump around"
    set -lx z_script_path "/usr/local/etc/profile.d/z.sh"
    if not test -f $z_script_path
        echo "z not found" >&2
        return 1
    end

    # Start a Bash process, source z, run the _z function, and capture the working directory and exit status.
    bash -c '
        source $z_script_path
        _z "$@" 2>&1
        z_status=$?
        echo "$PWD|$z_status" >&2
        exit $z_status
    ' bash $argv 2>| read -l z_result
    set -l z_status $status
    set -l arr_z_result (string split "|" $z_result)

    set -l z_pwd $arr_z_result[1]
    if test $z_status -eq 0
        set z_status $arr_z_result[2]
    end

    # If z changed directories, reflect that in the current process.
    if test $z_pwd != $PWD
        echo "z jumping to $z_pwd"
        builtin cd $z_pwd
    end

    return $z_status
end
