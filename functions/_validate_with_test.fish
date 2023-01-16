function _validate_with_test --description argparse\ validator\ for\ \'test\ \[TEST\]\ FILE\' --no-scope-shadowing

    # save test_args
    set -l test_args $argv

    # strip off not operator
    test $argv[1] != "!" || set argv $argv[2..]

    # verify one and only one test operator
    test (count $argv) -eq 1 || return 2

    # argparse file tests
    set -l options b c d e f g G k L O p r s S t u w x
    argparse -n _validate_with_test $options -- $argv
    or return 2

    # perform test
    if not test $test_args $_flag_value
        set -l msg (_ "%s: Value '%s' for flag '%s' does not pass 'test %s'\n")
        printf $msg $_argparse_cmd $_flag_value $_flag_name "$test_args" >&2
        return 1
    end
end
