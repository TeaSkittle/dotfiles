#!/usr/bin/bash

# Packages
echo "[+] Installing system packages..."
apt install -y git net-tools tldr emacs fish neofetch

echo "[+] Copying files..."

# X11
cp X11/.xprofile ~/.xprofile

# Emacs
cp emacs/.emacs.d/init.el ~/.emacs.d/init.el 

# Fish
cp fish/.config/fish/config.fish ~/.config/fish/config.fish 
f=$(command -v fish | sudo tee -a /etc/shells)
echo "[!] To change shell to fish: chsh -s $f"

echo "[+] Set up complete"
