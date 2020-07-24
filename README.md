# :rice: Rice

A simple rice/dotfiles repo for my Dell Optiplex 9020 running Debian stable. *(This is a constant work in progress and is always changing)* The setup.sh file is meant to be ran after a base install.

## Partitioning Scheme
```
/boot - 500M
/swap - 16G
/home
/
  * The last two split 50/50 of remaining size
```

## Setup

Log in a root after base install and run these commands ( replacing what is in all caps )

```bash
usermod -aG sudo USERNAME
git clone https://github.com/teaskittle/dotfiles
cd dotfiles
chmod 775 setup.sh
sudo ./setup.sh
stow VIM
```

Then edit ~/.xinitrc and add whatver window manager you prefer ( I use spectrwm, the only one setup.sh installs )

```bash
#!/bin/sh
# ~/.xinitrc
exec spectrwm
```
