#!/usr/bin/bash

echo "[+] Installing packages..."
sudo apt-get install -y git net-tools tldr emacs fish neofetch racket

echo "[+] Downloading repo..."
git clone https://github.com/TeaSkittle/dotfiles

echo "[+] Copying files..."
cd dotfiles/
mv X11/.xprofile ~/.xprofile
mv emacs/.emacs.d/init.el ~/.emacs.d/init.el 
mv fish/.config/fish/config.fish ~/.config/fish/config.fish 

echo "[+] Cleaning up files..."
cd ../
rm -rf dotfiles/
f=$(command -v fish | sudo tee -a /etc/shells)
echo "[!] To change shell to fish: chsh -s $f"
echo -e "\n[+] Set up complete\n"
