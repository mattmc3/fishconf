function otp --description "One-time passwords"
    # oathtool required
    if not type -q oathtool
        echo >&2 "otp: 'oathtool' not found. Install oathtool or oath-toolkit, depending on your OS."
        return 1
    end

    # gpg required
    if not type -q gpg
        echo >&2 "otp: 'gpg' not found. Install, and create a key with 'gpg --gen-key' if you don't already have one."
        return 1
    end

    # where do we store otp keys
    if not set -q OTP_HOME
        if set -q XDG_DATA_HOME
            set -g OTP_HOME $XDG_DATA_HOME/otp
        else
            set -g OTP_HOME $HOME/.local/share/otp
        end
    end
    if not test -e $OTP_HOME
        mkdir -p $OTP_HOME
        chmod 700 $OTP_HOME
    end

    # declare vars
    set -l usage "usage: otp [-h | --help] [-l | --list] [-a | --add] <key>"
    set -l recp
    set -l recipients
    for recp in $OTP_GPG_RECIPIENTS
        set -a recipients --recipient $recp
    end

    # parse arguments
    argparse --name=otp h/help l/list a/add e/erase -- $argv
    or return

    if test -n "$_flag_help"
        echo $usage && return
    else if test -n "$_flag_list"
        set -l files $OTP_HOME/*.otp.asc
        if test (count $files) -eq 0
            echo >&2 "otp: No one-time password keys found."
            return 1
        end
        for file in $files
            path basename $file | string replace '.otp.asc' ''
        end
    else if test -z "$argv"
        echo >&2 "otp: Expecting <key> argument."
        echo >&2 $usage
        return 1
    else if test -n "$_flag_add"
        read -s -l key --prompt-str="Enter the otp key for '$argv': "
        command rm -f $OTP_HOME/$argv.otp.asc
        echo "$key" | command gpg $recipients --armor --encrypt --output $OTP_HOME/$argv.otp.asc
    else if not test -e "$OTP_HOME/$argv.otp.asc"
        echo >&2 "otp: Key not found '$argv'."
        return 1
    else if test -n "$_flag_erase"
        command rm -f $OTP_HOME/$argv.otp.asc
    else
        set -l totpkey (gpg --quiet --decrypt $OTP_HOME/$argv.otp.asc)
        oathtool --totp --b $totpkey | tee /dev/stderr | pbcopy
    end
end
