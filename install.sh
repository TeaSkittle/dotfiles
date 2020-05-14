#!/usr/bin/sh

# Packages
apt-get install make build-essential libxft-dev \
libx11-dev libncurses-dev apt-file emacs feh scrot tldr \
pandoc tilix fish joe neofetch stow

# Update packages
apt-get update

# Copy files
cp wall.png ~/Pictures/wall.png
cp .gitconfig ~/.gitconfig

# Change shell (doesn't seem to work 100 percent)
chsh -s /usr/bin/fish
