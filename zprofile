# -*- sh -*-
# paths

# avoid duplicates
typeset -U path
typeset -U manpath

# path to coreutils commands with their normal names
path=(/usr/local/opt/coreutils/libexec/gnubin $path)

# path to coreutils man pages with normal names if you add
manpath=(/usr/local/opt/coreutils/libexec/gnuman $manpath)

# set PATH so it includes user's private bin if it exists
if [ -d ~/local/bin ]; then
    path=(~/local/bin $path)
fi

# export paths
export PATH
export MANPATH

# my TeX stuff
export TEXMFHOME=${HOME}/local/share/texmf
