.PHONY: help deps pip font

help:
	@echo "  deps        Install all dependencies."
	@echo "  pip         Install Python dependencies."

deps: pip font

pip:
	easy_install pip && \
		pip install -r python_requirements.txt

font:
	sh font_install
