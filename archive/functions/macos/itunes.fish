# https://github.com/oh-my-fish/plugin-osx/edit/master/functions/itunes.fish
function itunes -d 'Control iTunes.'
    if test (count $argv) -eq 0
        echo "No arguments given. Use -h or --help for a more detailed description." >&2
        return 1
    end

    set -l opt $argv[1]
    switch $opt
        case launch play pause stop rewind resume quit
        case mute
            set opt "set mute to true"
        case unmute
            set opt "set mute to false"
        case prev
            set opt "previous track"
        case next previous
            set opt "$opt track"
        case vol volume
            set opt "set sound volume to $argv[2]"
        case "" -h --help
            echo "Usage: itunes <option>"
            echo "option:"
            echo \t"launch, play, pause, stop, rewind, resume, quit"
            echo \t"mute, unmute    Control volume set"
            echo \t"next, prev      Play next or previous track"
            echo \t"vol             Set the volume, takes an argument from 0 to 100"
            echo \t"help            Show this message and exit"
            return 0
        case '*'
            echo "Unknown option $opt. Use -h or --help for a more detailed description."
            return 1
    end
    osascript -e "tell application \"iTunes\" to $opt"
end
