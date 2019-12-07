SHELL := /bin/sh

INSTALL := /usr/local/bin/ginstall

installdir := ~
zdotdir := $(installdir)/.local/zsh
zshenv := $(installdir)/.zshenv
zshrc := $(zdotdir)/.zshrc

all: $(zshenv) $(zshrc)

$(zshenv):
	$(file >$@,ZDOTDIR=$(zdotdir))

$(zshrc): zshrc | $(zdotdir)
	$(INSTALL) -m 0600 -T $< $@

$(zdotdir):
	$(INSTALL) -m 0700 -d $(zdotdir)

clean:
	-@rm $(zshenv)
	-@rm -rf $(zdotdir)
