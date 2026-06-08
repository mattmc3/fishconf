# Load directory-scoped environment variables via direnv.
type -q direnv; or return 1
direnv hook fish | source
