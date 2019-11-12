# makefile
.PHONY: help formatted
.DEFAULT_GOAL := help

formatted:
	find . \( -type f -or -type l \) -name '*.fish' ! -name 'fisher.fish' ! -path './fisher/*' ! -path './aliases/*' -exec fish_indent -w {} \;

help:
	@echo "help"
	@echo "    shows this message"
	@echo ""
	@echo "formatted"
	@echo "    Run fish_indent against all fish files. "
