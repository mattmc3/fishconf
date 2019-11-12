function pyclean --description 'Cleans python residue (*.pyc, *.pyo, __pycache__)'
    find . -type f -name "*.py[co]" -delete
    find . -type d -name "__pycache__" -delete
end
