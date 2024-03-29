#!/bin/bash

# Vim files
rsync -a --delete -P ~/.vimrc vim/vimrc 

# Neovim files
rsync -a --delete --exclude=plugged -P ~/.config/nvim .

# i3wm 
rsync -a --delete -P ~/.config/i3/config i3/

# Conky
rsync -a --delete -P ~/.conky/* conky/

# Compton
rsync -a --delete -P ~/.config/compton.conf compton/

# Polybar
rsync -a --delete -P ~/.config/polybar .

# Dunst
rsync -a --delete -P ~/.config/dunst .

# Rofi
rsync -a --delete -P ~/.config/rofi .

# Xfce4 terminal
rsync -a --delete -P ~/.config/xfce4/terminal/terminalrc xfce4/terminal

# GTK 3
rsync -a --delete -P ~/.config/gtk-3.0 .
 
# ZSH
rsync -a --delete -P ~/.zshrc zsh/zshrc
rsync -a --delete -P ~/.oh-my-zsh/themes/mikel.zsh-theme zsh/oh-my-zsh

# Wallpaper
# rsync -a --delete -P ~/.wallpaper wallpaper

# Redshift
rsync -a --delete -P ~/.config/redshift

# Alacritty
rsync -a --delete -P ~/.config/alacritty . 

# Fish
rsync -a --delete -P ~/.config/fish/config.fish fish/.
rsync -a --delete -P ~/.config/fish/fish_variables fish/.
