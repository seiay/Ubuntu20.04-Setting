# Ubuntu20.04 setup

## Install apps
1. tilix (apt)
1. zsh (apt)
1. git
1. neovim (from github)
1. fzf

## How to install and setup

### tilix (terminal emulater)

#### tilix settings
- Appearance
  - Window style : disable CSD
  - Terminal title style : none
  - Theme variant : dark
  - Check 'use a wide handle for splitters'
  - remove check 'show the terminal title even if it's the only terminal'
- Quake
  - Height percent : 90
  - change height percent to 100% `gsettings set com.gexperts.Tilix.Settings quake-height-percent 100`

### zsh

#### install
- run `$chsh -s $(which zsh)` and change login shell to zsh

#### settings
- Download `.zshrc` from my github repo

- install `zplug` from github

`$ curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh`

### fonts

1. Download a [Nerd Font](http://nerdfonts.com/)

2. Unzip and copy to `~/.fonts`

3. Run the command `fc-cache -fv` to manually rebuild the font cache

### neovim

#### install and setup
- install nvim >= 0.10.0
  - What works best for me
  - 1. Downlod the tar.gz file from the official site and extract it
  - 1. Move the extracted files to the appropriate location
    - ex) `sudo mv nvim-linux64 /opt/`
  - 1. Set up the PATH environment variable
    - ex) `sudo ln -s /opt/nvim-linux64/bin/nvim /usr/local/bin/nvim`
- download configuration directory ( `nvim` ) from my github repo
- `cp -r nvim ~/.config/`