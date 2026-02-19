# Set initial working directory.
set -g IWD $PWD

function iwd --description "Initial working directory"
    cd $IWD
end
