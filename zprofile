# -*- sh -*-
# paths

# avoid duplicates
typeset -U path

# path to homebrew sbin
path=(/usr/local/sbin $path)

# path to coreutils commands with their normal names
path=(/usr/local/opt/coreutils/libexec/gnubin $path)

# set PATH so it includes user's private bin if it exists
if [ -d ~/local/bin ]; then
    path=(~/local/bin $path)
fi

# export paths
export PATH

# my TeX stuff
export TEXMFHOME=${HOME}/local/share/texmf
