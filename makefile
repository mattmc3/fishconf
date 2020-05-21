# makefile
.PHONY: help pretty submodules
.DEFAULT_GOAL := help

pretty:
	find . \( -type f -or -type l \) -name '*.fish' ! -name 'fisher.fish' ! -path './fisher/*' ! -path './aliases/*' -exec fish_indent -w {} \;

submodules:
	git submodule update --recursive --remote

help:
	@echo "help"
	@echo "    shows this message"
	@echo ""
	@echo "pretty"
	@echo "    Run fish_indent against all fish files. "
