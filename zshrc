# -*- mode: sh -*-

# case insensitive globbing
setopt no_case_glob

# cycle through completions
setopt menu_complete

# history
HISTFILE=${ZDOTDIR:-$HOME}/.zsh_history
SAVEHIST=20000
HISTSIZE=50000
setopt share_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_find_no_dups
setopt hist_reduce_blanks

# correction
setopt correct
setopt correct_all
SPROMPT="Correct %F{red}%R%f to %F{green}%r%f [nyae]?"

# paths

# avoid duplicates
typeset -U path
typeset -U manpath

# path to coreutils commands with their normal names
path=(/usr/local/opt/coreutils/libexec/gnubin $path)

# path to coreutils man pages with normal names if you add
manpath=(/usr/local/opt/coreutils/libexec/gnuman $path)

# set PATH so it includes user's private bin if it exists
if [ -d ~/.local/bin ]; then
    path=(~/.local/bin $path)
fi

# export paths
export PATH
export MANPATH

# my TeX stuff
export TEXMFHOME=${HOME}/.local/share/texmf


# aliases
alias ls='ls -GFh --color'
alias yt-mp3='youtube-dl -x --audio-format mp3'
