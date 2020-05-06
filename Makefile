SHELL := /bin/sh

INSTALL := /usr/local/bin/ginstall

rootdir := $(HOME)
zdotdir := $(rootdir)/.local/zsh

all_deps := $(rootdir)/.zshenv $(zdotdir)/.zprofile $(zdotdir)/.zshrc

all: $(all_deps)

$(rootdir)/.zshenv:
	echo "# Set zsh config dir\nZDOTDIR=$(zdotdir)" >> $@

$(zdotdir)/.zshrc: zshrc | $(zdotdir)
	$(INSTALL) -m 0600 -T $< $@

$(zdotdir)/.zprofile: zprofile | $(zdotdir)
	$(INSTALL) -m 0600 -T $< $@

$(zdotdir):
	$(INSTALL) -m 0700 -d $(zdotdir)

clean:
	-@rm $(rootdir)/.zshenv
	-@rm -rf $(zdotdir)
