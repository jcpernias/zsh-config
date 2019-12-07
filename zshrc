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
