# -*- sh -*-

brewbin=/usr/local/bin/brew
if [[ $(arch) == 'arm64' ]]; then
  brewbin=/opt/homebrew/bin/brew
fi

# Init homebrew
eval "$($brewbin shellenv)"

# paths

# avoid duplicates
typeset -U path

# Homebrew: sbin
path=($HOMEBREW_PREFIX/sbin $path)

# Homebrew: sed with their normal name
path=($HOMEBREW_PREFIX/opt/gnu-sed/libexec/gnubin $path)

# Homebrew: coreutils commands with their normal names
path=($HOMEBREW_PREFIX/opt/coreutils/libexec/gnubin $path)

# Homebrew: findutils commands with their normal names
path=($HOMEBREW_PREFIX/opt/findutils/libexec/gnubin $path)

# Homebrew: texinfo and grep
path=($HOMEBREW_PREFIX/opt/texinfo/bin $HOMEBREW_PREFIX/opt/grep/libexec/gnubin $path)

# Hombrew: gfortran
path=($HOMEBREW_PREFIX/opt/gcc/bin $path)

# path for elpy
path=(~/.local/bin $path)

# path for gretl
path=(/Applications/Gretl.app/Contents/Resources/bin $path)

# set PATH so it includes user's private bin if it exists
if [ -d ~/local/bin ]; then
    path=(~/local/bin $path)
fi

# export paths
export PATH

# my TeX stuff
export TEXMFHOME=${HOME}/local/share/texmf

# language
export LANG="es_ES.UTF-8"
