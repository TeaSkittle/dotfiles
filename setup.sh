#!/usr/bin/sh
echo "[+] Installing system packages..."
apt install -y git net-tools tldr emacs fish neofetch
f=$(command -v fish | sudo tee -a /etc/shells)
echo "[-] To change shell to fish: chsh -s $f"
echo "[+] Set up complete"
