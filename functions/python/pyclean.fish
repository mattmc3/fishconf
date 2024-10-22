function pyclean -d 'Clean non-essential python files recursively'
    set -q $argv[1] && set argv '.'
    find "$argv" -type f -name "*.py[co]" -delete
    find "$argv" -type d -name __pycache__ -delete
end
