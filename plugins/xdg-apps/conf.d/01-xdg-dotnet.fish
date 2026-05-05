type -q dotnet; or return 1
set -q DOTNET_CLI_HOME; or set -gx DOTNET_CLI_HOME $XDG_DATA_HOME/dotnet
set -q NUGET_PACKAGES; or set -gx NUGET_PACKAGES $XDG_CACHE_HOME/NuGetPackages
set -q NUGET_CONFIGFILE; or set -gx NUGET_CONFIGFILE $XDG_CONFIG_HOME/NuGet/NuGet.Config
