function otp --description 'One-time passwords'
    # Set homes
    set --local secrets_home $SECRETS_HOME
    if not set -q SECRETS_HOME
        set -q XDG_DATA_HOME
        and set secrets_home $XDG_DATA_HOME/secrets
        or set secrets_home $HOME/.local/share/secrets
    end
    set --local otp_home $secrets_home/otp

    # requirements
    if not type -q oathtool
        echo >&2 "otp: 'oathtool' not found. Install oathtool or oath-toolkit, depending on your OS."
        return 1
    end
    if not type -q gpg
        echo >&2 "otp: 'gpg' not found. Install, and create a key with 'gpg --gen-key' if you don't already have one."
        return 1
    end

    # Set public key IDs
    set --local gpg_keys
    for pubkey in $secrets_home/pubkeys/*.asc
        set --append gpg_keys (gpg --show-keys --with-colons $pubkey | awk -F':' '/^pub/{print $5}')
    end

    # declare vars
    set --local usage "usage: otp [-h | --help] [-l | --list] [-a | --add] [-r | --remove] [--rekey] <key>"
    set --local recipients
    for key in $gpg_keys
        set --append recipients --recipient $key
    end

    # parse arguments
    argparse --name=otp h/help l/list a/add r/remove rekey -- $argv
    or return 1

    if test -n "$_flag_help"
        echo "otp [OPTIONS] [<OTP>]"
        echo "flags:"
        echo "  -h, --help          Show help"
        echo "  -l, --list          List keys"
        echo "      --rekey         Rebuild encrypted OTPs"
        echo "  -a, --add <OTP>     Add <OTP>"
        echo "  -r, --remove <OTP>  Remove <OTP>"
        return 0
    else if test -n "$_flag_list"
        # list
        set --local files $otp_home/*.otp.asc
        if test (count $files) -eq 0
            echo >&2 "otp: No one-time password keys found."
            return 1
        end
        for file in $files
            path basename $file | string replace '.otp.asc' ''
        end
        return
    else if test -n "$_flag_rekey"
        # rekey
        set --local totpkey
        for file in $otp_home/*.otp.asc
            set totpkey (gpg --quiet --decrypt $file)
            echo $totpkey | gpg $recipients --armor --encrypt --output $file.new
            if test $status = 0
                mv -f $file.new $file
            else
                rm -f $file.new
                return 1
            end
        end
    else if test (count $argv) -eq 0
        echo >&2 "otp: Expecting <OTP> argument."
        echo >&2 $usage
        return 1
    else if test -n "$_flag_add"
        read -s -l otp_secret --prompt-str="Enter the otp secret for '$argv': "
        command rm -f $otp_home/$argv.otp.asc
        echo $otp_secret | gpg $recipients --armor --encrypt --output $otp_home/$argv.otp.asc
        otp $argv
    else if not test -e $otp_home/$argv.otp.asc
        echo >&2 "otp: Key not found '$argv'."
        return 1
    else if test -n "$_flag_remove"
        command rm -f $otp_home/$argv.otp.asc
    else
        set --local totpkey (gpg $recipients --quiet --decrypt $otp_home/$argv.otp.asc)
        if type -q pbcopy
            oathtool --totp --b $totpkey | tee /dev/stderr | pbcopy
        else
            oathtool --totp --b $totpkey
        end
    end
end
