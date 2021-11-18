# makefile
.PHONY: help pretty submodules
.DEFAULT_GOAL := help

pretty:
	fish -c "fish_indent -w (string match --invert --entire ./fisher/ ./**/*.fish)"

submodules:
	git submodule update --recursive --remote

help:
	@echo "help"
	@echo "    shows this message"
	@echo ""
	@echo "pretty"
	@echo "    Run fish_indent against all fish files. "
