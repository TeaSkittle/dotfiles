#!/usr/bin/sh
#
# Packages
#
echo "[+] Installing system packages..."
apt install -y \
git stow net-tools whois pandoc scrot tldr dos2unix \
emacs joe fish neofetch python3-pip python3-setuptools \
htop vim shellcheck surf
echo "[+] Installing pip packages"
pip3 install speedtest-cli
echo "[+] Updating system..."
apt update
#
# Configurations
#
echo "[+] Moving .gitconfig to home..."
mv .gitconfig ~/.gitconfig
echo "[+] Downloading and moving tron-legacy-theme.el ..."
curl -LO https://raw.githubusercontent.com/ianpan870102/tron-legacy-emacs-theme/master/tron-legacy-theme.el
mkdir .emacs.d/themes/
mv tron-legacy-theme.el .emacs.d/themes/
#
# Fish
#
echo "[+] Setting fish as default shell..."
which fish | sudo tee -a /etc/shells
chsh -s /usr/local/bin/fish
# Complete
echo "[+]Set up complete"


