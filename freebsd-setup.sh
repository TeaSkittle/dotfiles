#!/bin/sh

#Check if root
if [ "$(id -u)" -ne 0 ]
  then echo -e "\033[33mPlease run as root\033[0m"
  exit
fi

# Get username and store as variable
echo -e "What is your normal user's username? " 
read normal

# Packages
pkg update
pkg upgrade -y
pkg install firefox mate fish emacs git nvidia-driver neofetch mpv pavucontrol-qt telegram-desktop fusefs-exfat

# Brave install
git clone https://github.com/mrclksr/linux-browser-installer.git
cd linux-browser-installer
./linux-browser-installer install brave
cd ..
rm -rf linux-browser-installer/

# Config files
curl https://raw.githubusercontent.com/TeaSkittle/dotfiles/master/emacs/.emacs.d/init.el > /usr/home/$normal/.emacs.d/init.el

# Nvidia
kldload nvidia-modeset
sysrc kld_list+=nvidia-modeset

# Set audio device rear analog
echo "hw.snd.default_unit=3" >> /etc/sysctl.conf

# Silence Bell
echo "kern.vt.enable_bell=0" >> /etc/sysctl.conf
echo "hw.syscons.bell=0" >> /etc/sysctl.conf

# Boot options
echo 'boot_mute="YES"' >> /boot/loader.conf
echo 'autoboot_delay="2"' >> /boot/loader.conf

# X11/MATE start
echo "exec ck-launch-session mate-session" > /usr/home/$normal/.xinitrc

# Allow mounting
echo 'devfs_system_ruleset="localrules"' >> /etc/rc.conf
echo 'vfs.usermount=1' >> /etc/sysctl.conf
mkdir /mnt/$normal
chown $normal:$normal /mnt/$normal

# Enable exFat
kldload fusefs
echo 'fusefs_load="YES"' >> /boot/loader.conf

# Mpv
#echo "audio-device=oss//dev/dsp3" > .config/mpv/mpv.conf

shutdown -r now

