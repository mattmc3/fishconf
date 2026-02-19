function init_xdg
    # XDG Base Directory compliance for various tools.
    # https://wiki.archlinux.org/title/XDG_Base_Directory

    # gnupg
    set -q GNUPGHOME; or set -gx GNUPGHOME $XDG_DATA_HOME/gnupg

    # less
    set -q LESSHISTFILE; or set -gx LESSHISTFILE $XDG_DATA_HOME/lesshst

    # sqlite
    set -q SQLITE_HISTORY; or set -gx SQLITE_HISTORY $XDG_DATA_HOME/sqlite_history

    # nuget
    set -q NUGET_PACKAGES; or set -gx NUGET_PACKAGES $XDG_CACHE_HOME/NuGetPackages

    # python
    set -q WORKON_HOME; or set -gx WORKON_HOME $XDG_DATA_HOME/venvs
    set -q PYLINTHOME; or set -gx PYLINTHOME $XDG_CACHE_HOME/pylint
    set -q JUPYTER_CONFIG_DIR; or set -gx JUPYTER_CONFIG_DIR $XDG_CONFIG_HOME/jupyter

    # ruby bundler
    set -q BUNDLE_USER_CONFIG; or set -gx BUNDLE_USER_CONFIG $XDG_CONFIG_HOME/bundle
    set -q BUNDLE_USER_CACHE; or set -gx BUNDLE_USER_CACHE $XDG_CACHE_HOME/bundle
    set -q BUNDLE_USER_PLUGIN; or set -gx BUNDLE_USER_PLUGIN $XDG_DATA_HOME/bundle

    # ruby gems
    set -q GEM_HOME; or set -gx GEM_HOME $XDG_DATA_HOME/gem
    set -q GEM_SPEC_CACHE; or set -gx GEM_SPEC_CACHE $XDG_CACHE_HOME/gem

    # nim
    set -q NIMBLE_DIR; or set -gx NIMBLE_DIR $XDG_DATA_HOME/nimble

    # rust
    set -q CARGO_HOME; or set -gx CARGO_HOME $XDG_DATA_HOME/cargo
    set -q RUSTUP_HOME; or set -gx RUSTUP_HOME $XDG_DATA_HOME/rustup

    # node
    set -q NPM_CONFIG_USERCONFIG; or set -gx NPM_CONFIG_USERCONFIG $XDG_CONFIG_HOME/npm/npmrc
    set -q NODE_REPL_HISTORY; or set -gx NODE_REPL_HISTORY $XDG_DATA_HOME/nodejs/repl_history

    # postgres
    set -q PSQLRC; or set -gx PSQLRC $XDG_CONFIG_HOME/pg/psqlrc
    set -q PSQL_HISTORY; or set -gx PSQL_HISTORY $XDG_CACHE_HOME/pg/psql_history
    set -q PGPASSFILE; or set -gx PGPASSFILE $XDG_CONFIG_HOME/pg/pgpass
    set -q PGSERVICEFILE; or set -gx PGSERVICEFILE $XDG_CONFIG_HOME/pg/pg_service.conf
end
