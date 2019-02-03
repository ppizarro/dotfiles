#!/bin/sh

dotfilesdir=$(pwd)
dotfiles=(.zshrc .aliases .exports .functions .tmux.conf .wgetrc .xinitrc .Xresources)
dotfiles_configdir=$(pwd)/.config
dotfiles_config=(alacritty compton dunst htop i3 i3blocks rofi)

# Install config.
for dots in "${dotfiles[@]}"
do
    /bin/rm -rf ~/${dots}
    /bin/ln -fs "$dotfilesdir/${dots}" ~/
done

# Install config to ~/.config.
mkdir -p ~/.config
for dots_conf in "${dotfiles_config[@]}"
do
    /bin/rm -rf ~/.config/${dots_conf}
    /bin/ln -fs "$dotfiles_configdir/${dots_conf}" ~/.config/
done

