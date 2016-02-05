.PHONY: help deps pip font

help:
	@echo "  deps        Install all dependencies."
	@echo "  pip         Install Python dependencies."

deps: pip font

pip:
	sudo pip install -r python_requirements.txt

font:
	sh font_install
