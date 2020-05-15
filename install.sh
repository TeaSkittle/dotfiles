#!/usr/bin/sh

# Install packages
apt-get install - y \

# Build packages
make build-essential libxft-dev libx11-dev libncurses-dev \

# Tools
apt-file stow net-tools whois pandoc feh scrot tldr neofetch \

# Desktop Environment
spectrwm emacs tilix fish joe  

# Update packages
apt-get update

# Move files
mv .gitconfig ~/.gitconfig

# Change shell (doesn't seem to work 100 percent)
chsh -s /usr/bin/fish

# Clean up
rm README.md scrot.png wall.png
