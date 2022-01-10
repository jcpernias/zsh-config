# -*- sh -*-
# paths

# avoid duplicates
typeset -U path

# Homebrew: sbin
path=(/usr/local/sbin $path)

# Homebrew: coreutils commands with their normal names
path=(/usr/local/opt/coreutils/libexec/gnubin $path)

# Homebrew: findutils commands with their normal names
path=(/usr/local/opt/findutils/libexec/gnubin $path)

# Homebrew: texinfo and grep
path=(/usr/local/opt/texinfo/bin /usr/local/opt/grep/libexec/gnubin $path)

# path for elpy
path=(~/.local/bin $path)

# set PATH so it includes user's private bin if it exists
if [ -d ~/local/bin ]; then
    path=(~/local/bin $path)
fi

# export paths
export PATH

# my TeX stuff
export TEXMFHOME=${HOME}/local/share/texmf
