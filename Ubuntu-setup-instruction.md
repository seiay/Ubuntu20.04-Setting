# ubuntu setup

## apps
1. tilix (apt)
1. zsh (apt)
1. git
1. neovim (from github)
1. fzf

## terminal
### tilix
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

### neovim
#### install
- install nvim >= 0.10.0
- download configuration directory ( `nvim` ) from my github repo
- `cp -r nvim ~/.config/`
