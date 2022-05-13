#!/usr/bin/bash

# Packages
echo "[+] Installing system packages..."
apt install -y git net-tools tldr emacs fish neofetch

echo "[+] Downloading repo..."
git clone https://github.com/TeaSkittle/dotfiles

echo "[+] Copying files..."
cd dotfiles/
cp X11/.xprofile ~/.xprofile
cp emacs/.emacs.d/init.el ~/.emacs.d/init.el 
cp fish/.config/fish/config.fish ~/.config/fish/config.fish 

# Print fish command
f=$(command -v fish | sudo tee -a /etc/shells)
echo "[!] To change shell to fish: chsh -s $f"

echo "[+] Set up complete"
