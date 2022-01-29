# -*- sh -*-

# Init homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# paths

# avoid duplicates
typeset -U path

# Homebrew: sbin
path=($(brew --prefix)/sbin $path)

# Homebrew: coreutils commands with their normal names
path=($(brew --prefix)/opt/coreutils/libexec/gnubin $path)

# Homebrew: findutils commands with their normal names
path=($(brew --prefix)/opt/findutils/libexec/gnubin $path)

# Homebrew: texinfo and grep
path=($(brew --prefix)/opt/texinfo/bin $brew_prefix/opt/grep/libexec/gnubin $path)

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
