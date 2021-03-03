# Dotfiles

* [The best way to store your dotfiles: A bare Git repository](https://www.atlassian.com/git/tutorials/dotfiles)
* [![Git Bare Repository - A Better Way To Manage Dotfiles](https://img.youtube.com/vi/tBoLDpTWVOM/0.jpg)](https://www.youtube.com/watch?v=tBoLDpTWVOM)

## Zsh

* [ohmyzsh](https://ohmyz.sh/)
```sh
# install oh my zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```
* [spaceship](https://denysdovhan.com/spaceship-prompt/)
```sh
# combine spaceship with ohmyzsh
git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt" --depth=1
ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme" 
```


## Base
```sh
# install terminals
sudo pacman -S kitty alacritty termite

# install rust
sudo pacman -S rustup lldb
rustup toolchain install stable

# install paru
git clone https://aur.archlinux.org/paru.git /tmp/paru
cd /tmp/paru
makepkg -si
cd -

# install nerd fonts
paru -S nerd-fonts-meslo 

# install ranger
paru -S ranger python-ueberzug

# install vs code
sudo pacman -S code

# install utils
paru -S toilet toilet-fonts
```


## Neovim 

* [neovim](.config/nvim/README.md)

## AwesomeWM

* [awesome](.config/awesome/README.md)

