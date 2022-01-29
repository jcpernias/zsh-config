# zsh

Configuration files for zsh on macOS Catalina.

## From bash to zsh ##

Change the default shell:

``` shell
chsh -s /bin/zsh
```

Also, move `.profile` to `.bash_profile` to prevent zsh from reading
it.

## Configuration files ##

### zshenv

Set the configuration directory `ZDOTDIR` in `~/.zshenv`:

``` shell
ZDOTDIR=~/.local/zsh
```

### zprofile

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

### zshrc

- Set path to oh-my-zsh installation
  ``` shell
  export ZSH=$ZDOTDIR/oh-my-zsh
  ```

- Custom folder for oh-my-zsh:
  ``` shell
  ZSH_CUSTOM=$ZDOTDIR/custom
  ```

- Set theme:
  ``` shell
  ZSH_THEME="robbyrussell"
  ```

- Plugins:
  ``` shell
  plugins=(
  git
  macos
  sudo
  z
  web-search
  zsh-autosuggestions
  zsh-syntax-highlighting)
  ```

### custom.zsh

- Correct:

  ``` shell
  setopt correct
  setopt correct_all
  SPROMPT="Correct %F{red}%R%f to %F{green}%r%f [nyae]?"
  ```

- Aliases:

  ``` shell
  alias ls='ls -GFh --color'
  alias yt-mp3='youtube-dl -x --audio-format mp3'
  ```
