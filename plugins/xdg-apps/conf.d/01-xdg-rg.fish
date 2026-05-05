type -q rg; or return 1
set -q RIPGREP_CONFIG_PATH; or set -gx RIPGREP_CONFIG_PATH $XDG_CONFIG_HOME/ripgrep/config
