# zsh

Configuration files for zsh on macOS Catalina.

## From bash to zsh ##

Change the default shell:

``` shell
chsh -s /bin/zsh
```

Also, move `.profile` to `.bash_profile` to prevent zsh from reading
it.

## Set the configuration directory ##

Set `ZDOTDIR` in `~/.zshenv`:

``` shell
ZDOTDIR=~/.local/zsh
```

## Configuration file ##

- Case insensitive globbing:
  ``` shell
  setopt no_case_glob
  ```

- Cycle through completions:
  ``` shell
  setopt menu_complete
  ```

- History configuration:
  ``` shell
  HISTFILE=${ZDOTDIR:-$HOME}/.zsh_history
  SAVEHIST=20000
  HISTSIZE=50000
  setopt share_history
  ```
  Clean out duplicates and blanks:
  ``` shell
  setopt hist_expire_dups_first
  setopt hist_ignore_dups
  setopt hist_find_no_dups
  setopt hist_reduce_blanks
  ```

- Correct typos and paths:
  ``` shell
  setopt correct
  setopt correct_all
  SPROMPT="Correct %F{red}%R%f to %F{green}%r%f [nyae]?"
  ```

- Paths:
  ``` shell
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

  #export paths
  export PATH
  export MANPATH
  ```

- Private TeX macros:

  ``` shell
  export TEXMFHOME=${HOME}/.local/share/texmf
  ```

- Aliases:

  ``` shell
  alias ls='ls -GFh --color'
  alias yt-mp3='youtube-dl -x --audio-format mp3'
  ```

- Completion:

  ``` shell
  autoload -Uz compinit && compinit
  ```
