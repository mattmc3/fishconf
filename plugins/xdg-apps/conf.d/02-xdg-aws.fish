type -q aws; or return 1
set -q AWS_SHARED_CREDENTIALS_FILE; or set -gx AWS_SHARED_CREDENTIALS_FILE $XDG_CONFIG_HOME/aws/credentials
set -q AWS_CONFIG_FILE; or set -gx AWS_CONFIG_FILE $XDG_CONFIG_HOME/aws/config
