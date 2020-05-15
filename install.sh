#!/usr/bin/sh

# Packages
# Build packages
apt-get install make build-essential libxft-dev libx11-dev libncurses-dev  \
# Tools
apt-file stow net-tools whois pandoc feh scrot tldr \
# Apps
emacs tilix fish joe neofetch 

# Update packages
apt-get update

# Copy files
cp wall.png ~/Pictures/wall.png
cp .gitconfig ~/.gitconfig

# Change shell (doesn't seem to work 100 percent)
chsh -s /usr/bin/fish
