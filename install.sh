#!/usr/bin/sh
# Install and setup for Pop!_OS

# Install packages
apt-get install - y \

# Tools
git stow net-tools whois pandoc scrot tldr neofetch \

# Desktop Environment
emacs joe fish

# Update packages
apt-get update

# Move files
mv .gitconfig ~/.gitconfig

# Set up emacs tron theme from git
curl -LO https://raw.githubusercontent.com/ianpan870102/tron-legacy-emacs-theme/master/tron-legacy-theme.el
mkdir .emacs.d/themes/
mv tron-legacy-theme.el .emacs.d/themes/

# Change shell (doesn't seem to work 100 percent)
chsh -s /usr/bin/fish

# Stow files
stow emacs joe

