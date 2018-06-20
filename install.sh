#!/bin/sh

#Tmux configuration
echo "Creating backups of any current tmux configurations..."
cp ~/.tmux.conf ~/.tmux.conf.OLD

echo "Installing my tmux configuration..."
cp tmux/tmux.conf ~/.tmux.conf

#Xdefaults
echo "Creating backup of ~/.Xdefaults..."
cp ~/.Xdefaults ~/.Xdefaults.OLD

echo "Installing my Xdefault configuration..."
cp URxvt/Xdefaults ~/.Xdefaults

#i3
echo "Creating backup of ~/.config/i3/config..."
mkdir -p ~/.config/i3/config 2> /dev/null
cp ~/.config/i3/config ~/.config/i3/config.OLD
cp ~/.i3blocks.conf ~/.i3blocks.conf.OLD

echo "Installing my i3 configuration..."
cp i3/config ~/.config/i3/config 
cp i3/i3blocks.conf ~/.i3blocks.conf

echo ""
