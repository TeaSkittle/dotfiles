#!/usr/bin/sh
echo "[+] Installing system packages..."
apt install -y \
git stow net-tools whois pandoc scrot tldr dos2unix \
emacs joe fish neofetch python3-pip python3-setuptools \
htop vim shellcheck surf jed firefox-esr spectrwm xorg mg
echo "[+] Installing pip packages"
pip3 install speedtest-cli
echo "[+] Updating system..."
apt update
echo "[+] Setting up config files"
cp .gitconfig ~/.gitconfig
f=$(command -v fish | sudo tee -a /etc/shells)
echo "[-] To change shell to fish: chsh -s $f"
echo "[+] Set up complete"
