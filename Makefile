.PHONY: help deps pip

help:
	@echo "  deps        Install all dependencies."
	@echo "  pip         Install Python dependencies."

deps: pip

pip:
	easy_install pip && \
		pip install -r python_requirements.txt