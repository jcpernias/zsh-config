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
