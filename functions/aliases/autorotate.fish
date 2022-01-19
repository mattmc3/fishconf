# Defined via `source`
function autorotate --wraps='jhead -autorot' --description 'alias autorotate jhead -autorot'
    jhead -autorot $argv
end
