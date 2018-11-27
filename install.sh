#!/bin/sh
DIR=`pwd`

#Tmux configuration
echo "Installing my tmux configuration..."
rm -f ~/.tmux.conf
ln -s $PWD/tmux/tmux.conf ~/.tmux.conf

#Xdefaults
echo "Installing my Xdefault configuration..."
rm -f ~/.xinitrc
ln -s $PWD/xorg/xinitrc ~/.xinitrc
rm -f ~/.Xdefaults
ln -s $PWD/xorg/Xdefaults ~/.Xdefaults

#i3
echo "Installing my i3 configuration..."
mkdir -p ~/.config/i3 2> /dev/null
rm -f ~/.config/i3/config 
ln -s $PWD/i3/config ~/.config/i3/config

mkdir -p ~/.config/i3status 2> /dev/null
rm -f ~/.config/i3status/config 
ln -s $PWD/i3/i3status.conf ~/.config/i3status/config

rm -f ~/.i3blocks.conf
ln -s $PWD/i3/i3blocks.conf ~/.i3blocks.conf

echo ""
