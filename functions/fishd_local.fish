# Defined in - @ line 0
function fishd_local --description 'Gets name of fishd file'
    ifconfig en0 | awk '/ether/{print $2}' | sed 's/://g' | xargs -I '{}' echo "$HOME/.config/fish/fishd.{}"
end
