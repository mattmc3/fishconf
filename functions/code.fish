function code --wraps='open -b com.microsoft.VSCode' --description 'alias code open -b com.microsoft.VSCode'
    # https://github.com/fish-shell/fish-shell/issues/9127
    open -b com.microsoft.VSCode $argv
end
