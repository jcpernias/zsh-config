SHELL := /bin/sh

INSTALL := /usr/local/bin/ginstall

rootdir := $(HOME)
zdotdir := $(rootdir)/.local/zsh
ohmyzshdir := $(zdotdir)/oh-my-zsh
customdir := $(zdotdir)/custom
pluginsdir := $(customdir)/plugins

all_deps := $(rootdir)/.zshenv $(zdotdir)/.zprofile $(zdotdir)/.zshrc \
	$(ohmyzshdir) $(customdir)/custom.zsh \
	$(pluginsdir)/zsh-autosuggestions \
	$(pluginsdir)/zsh-syntax-highlighting

all: $(all_deps)

./install.sh:
	wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh

$(ohmyzshdir): ./install.sh | $(zdotdir)
	ZSH=$@ sh $< --unattended --keep-zshrc
	rm $(rootdir)/.zshrc 

$(pluginsdir)/zsh-autosuggestions: | $(pluginsdir)
	git clone https://github.com/zsh-users/zsh-autosuggestions.git $@

$(pluginsdir)/zsh-syntax-highlighting: | $(pluginsdir)
	git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $@

$(rootdir)/.zshenv:
	echo "# Set zsh config dir\nZDOTDIR=$(zdotdir)" >> $@

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
	-@rm $(rootdir)/.zshenv
	-@rm -rf $(zdotdir)
