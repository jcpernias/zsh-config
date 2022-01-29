SHELL := /bin/sh

INSTALL := /usr/bin/install
GIT := /usr/bin/git
WGET := /usr/bin/wget
ECHO := /bin/echo
RM := /bin/rm

-include local.mk

rootdir := $(HOME)
zdotdir := $(rootdir)/.local/zsh
ohmyzshdir := $(zdotdir)/oh-my-zsh
customdir := $(zdotdir)/custom
pluginsdir := $(customdir)/plugins

all_deps := $(rootdir)/.zshenv $(zdotdir)/.zprofile $(zdotdir)/.zshrc \
	$(ohmyzshdir) $(customdir)/custom.zsh \
	$(pluginsdir)/zsh-autosuggestions \
	$(pluginsdir)/zsh-syntax-highlighting

ohmyzsh_url := https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh

all: $(all_deps)

./install.sh:
	$(WGET) $(ohmyzsh_url)

$(ohmyzshdir): ./install.sh | $(zdotdir)
	$(shell ZSH=$@ $< --unattended --keep-zshrc)
	$(RM) $(rootdir)/.zshrc

$(pluginsdir)/zsh-autosuggestions: | $(pluginsdir)
	$(GIT) clone https://github.com/zsh-users/zsh-autosuggestions.git $@

$(pluginsdir)/zsh-syntax-highlighting: | $(pluginsdir)
	$(GIT) clone https://github.com/zsh-users/zsh-syntax-highlighting.git $@

$(rootdir)/.zshenv:
	$(ECHO) "# Set zsh config dir\nZDOTDIR=$(zdotdir)" >> $@

$(zdotdir)/.zshrc: zshrc | $(zdotdir)
	$(INSTALL) -m 0600 -T $< $@

$(customdir)/custom.zsh: custom.zsh | $(customdir)
	$(INSTALL) -m 0600 -T $< $@

$(zdotdir)/.zprofile: zprofile | $(zdotdir)
	$(INSTALL) -m 0600 -T $< $@

$(zdotdir):
	$(INSTALL) -m 0700 -d $@

$(customdir):
	$(INSTALL) -m 0700 -d $@

$(pluginsdir):
	$(INSTALL) -m 0700 -d $@

clean:
	-@$(RM) $(rootdir)/.zshenv
	-@$(RM) -rf $(zdotdir)
