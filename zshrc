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
