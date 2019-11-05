function cleanpy --description "Clean python files"
    find . -type f -name "*.py[co]" -delete
    find . -type d -name "__pycache__" -delete
end
