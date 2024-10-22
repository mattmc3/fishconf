function vscode --wraps='open -b com.microsoft.VSCode' --description 'alias vscode open -b com.microsoft.VSCode'
    # https://github.com/fish-shell/fish-shell/issues/9127
    open -b com.microsoft.VSCode $argv
end
