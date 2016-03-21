.PHONY: help deps apt pip font gtags

help:
	@echo "  deps        Install all dependencies."
	@echo "  pip         Install Python dependencies."

deps: apt pip gtags

apt:
    sudo apt-get install fonts-inconsolata -y

pip:
	sudo pip install -r python_requirements.txt

font:
	sh font_install

gtags:
    curl -s https://raw.githubusercontent.com/Gnouc/emacs.d/master/global_install | sudo sh
    sudo ln -s /usr/local/stow/global/bin/gtags /usr/bin/gtags
