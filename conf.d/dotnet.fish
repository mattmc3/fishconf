# Add bin directories to path.
set -g pre_path $pre_path (
    path filter $DOTNET_CLI_HOME/tools /Applications/Rider.app/Contents/MacOS
)
fish_add_path --prepend --move $pre_path
