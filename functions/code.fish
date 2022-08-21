function code --wraps='open -W -b com.microsoft.VSCode' --description 'alias code open -W -b com.microsoft.VSCode'
    # https://github.com/fish-shell/fish-shell/issues/9127
    open -W -b com.microsoft.VSCode $argv;
end
