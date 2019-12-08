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
