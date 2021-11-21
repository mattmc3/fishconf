function ensure-brew -d 'Ensure specified homebrew app is installed'
    if not type -q brew
        bash -c '/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"'
    end
    if [ (count $argv) -gt 0 ]
        if not type -q $argv[1]
            brew install $argv[1]
        end
    end
end
