#!/bin/tcsh
pkg install aria2 calc doas drm-kmod dust exfat-utils firacode foot fzf gdisk gimp gnome-keyring grim htop inkscape keepassxc krita megatools mpv mpvpaper nemo neovim netsurf nheko noto-emoji noto-extra noto-hk noto-jp noto-kr noto-sc py39-autotiling py39-pip qt5-imageformats river rust slurp solvespace sway ungoogled-chromium vifm wf-recorder wine-devel wine-mono-devel wipe wireshark wofi wtype
curl -s https://raw.githubusercontent.com/StevenBlack/hosts/master/alternates/fakenews-gambling-porn-social/hosts | sed -n '/stevenblack.com/,$p' >> /etc/hosts
mkdir -p /home/USER/.config/foot
mkdir -p /home/USER/.config/mpv
mkdir -p /home/USER/.config/sway
mv foot.ini /home/USER/.config/foot/
curl https://raw.githubusercontent.com/mpv-player/mpv/master/TOOLS/lua/autoload.lua -o /home/USER/.config/mpv/autoload.lua
mv image-input.conf /home/USER/.config/mpv/
mv mpv.conf /home/USER/.config/mpv/
mv config /home/USER/.config/sway/
chown -R USER:USER /home/USER/
