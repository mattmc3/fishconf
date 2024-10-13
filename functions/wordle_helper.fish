# change this to whatever dictionary file you want
set -q DICT_FILE || set -U DICT_FILE /usr/share/dict/words

function _validate_wordle_score -d "argparse validator for Wordle score args"
    # scores are in the format '12345' with digits representing the score position
    _validate_int; or return 1
    if not string match -qr '^[1-5]+$' -- $_flag_value
        set --local msg (_ "%s: Value '%s' for flag '%s' contains out-of-range numbers. Expecting 1-5.\n")
        printf $msg $_argparse_cmd $_flag_value $_flag_name >&2 && return 1
    end
end

function __wordle_helper_usage -d "Print usage string for Fish Wordle Helper"
    echo "wordle_helper - Fish function to help with Wordle puzzles"
    echo
    echo "Usage:"
    echo "  wordle_helper [--green <exact_positions>] [--yellow <not_exact_positions>] <guess>"
    echo
    echo "Options:"
    echo "  -h, --help     Print help"
    echo "  -g, --green    Position of letters that matched exactly (format: 12345)"
    echo "  -y, --yellow   Position of letters that are not exact (format: 12345)"
    echo
    echo "Example:"
    echo "\$ wordle_helper -y 23 SLATE | wordle_helper -y 245 CORAL | wordle_helper -y 12 -g 34 GALOP"
    echo AGLOW
end

function wordle_helper -d "Show possible remaining guesses for a Wordle puzzle"
    argparse --name wordle_helper h/help 'g/green=+!_validate_wordle_score' \
        'y/yellow=+!_validate_wordle_score' -- $argv
    or return 1

    if test -n "$_flag_help"
        __wordle_helper_usage && return
    end

    if not string match -rq '^[A-z]{5}$' -- $argv[1]
        echo >&2 "Expecting a 5-letter word argument. Got '$argv[1]'."
        return 1
    end

    # Use standard dictionary, or whatever words were piped in.
    set --local dictwords
    if not test -t 0
        while read --line word
            if string match -qr '^[A-z]{5}$' -- $word
                set -a dictwords (string upper $word)
            end
        end
    else
        set dictwords (cat $DICT_FILE | string match -re '^[a-z]{5}$' | string upper)
    end

    set --local guess (string upper -- $argv[1] | string split '')
    set --local not_found_letters

    # Make a regex like 'A..D.' for green (exact) matches (ex: wordle_helper -g 14 ABIDE)
    set --local green_match (string split '' '.....')
    for idx in (string split '' $_flag_green)
        set green_match[$idx] $guess[$idx]
    end

    # Make a regex like '..[^I][^D].' for yellow (non-exact) matches to indicate where
    # the charaters aren't, but also filter dict to only words with those letters.
    set --local yellow_match (string split '' '.....')
    for idx in (string split '' $_flag_yellow)
        set yellow_match[$idx] "[^"$guess[$idx]"]"
        set dictwords (string match -er $guess[$idx] -- $dictwords)
    end

    # Collect letters that aren't in the answer.
    for idx in (seq 5)
        if not contains $idx -- (string split '' $_flag_green $_flag_yellow)
            set -a not_found_letters $guess[$idx]
        end
    end

    # Regex filter on green, yellow, and not found.
    string upper $dictwords | sort | uniq |
        string match -er (string join '' $green_match) |
        string match -er (string join '' $yellow_match) |
        string match -er '^[^'(string join '' $not_found_letters)']+$'
end
