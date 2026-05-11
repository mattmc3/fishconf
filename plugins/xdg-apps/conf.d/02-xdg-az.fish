type -q az; or return 1
set -q AZURE_CONFIG_DIR; or set -gx AZURE_CONFIG_DIR $XDG_DATA_HOME/azure
