#!/bin/bash
#
# boot script for Really Different Workspaces
# ©2024 Dirk Haar cinnamon_rdw@mideal.de
# run at boot and stop
#

mkdir /mnt/RAMDISK/.nirvana
mkdir /mnt/RAMDISK/Wallpaper
cp ~/Wallpaper/1.jpg  /mnt/RAMDISK/Wallpaper
cp ~/Wallpaper/2.jpg  /mnt/RAMDISK/Wallpaper
cp ~/Wallpaper/3.jpg  /mnt/RAMDISK/Wallpaper
cp ~/Wallpaper/4.jpg  /mnt/RAMDISK/Wallpaper
cp ~/Wallpaper/5.jpg  /mnt/RAMDISK/Wallpaper
cp ~/Wallpaper/6.jpg  /mnt/RAMDISK/Wallpaper

mkdir ~/$(basename $(xdg-user-dir DESKTOP))0 2> /mnt/RAMDISK/.nirvana
mkdir ~/$(basename $(xdg-user-dir DESKTOP))1 2> /mnt/RAMDISK/.nirvana
mkdir ~/$(basename $(xdg-user-dir DESKTOP))2 2> /mnt/RAMDISK/.nirvana
mkdir ~/$(basename $(xdg-user-dir DESKTOP))3 2> /mnt/RAMDISK/.nirvana
mkdir ~/$(basename $(xdg-user-dir DESKTOP))4 2> /mnt/RAMDISK/.nirvana
mkdir ~/$(basename $(xdg-user-dir DESKTOP))5 2> /mnt/RAMDISK/.nirvana

mkdir /mnt/RAMDISK/desktop0 && cp -a ~/$(basename $(xdg-user-dir DESKTOP))0/* /mnt/RAMDISK/desktop0/ 2> /mnt/RAMDISK/.nirvana
mkdir /mnt/RAMDISK/desktop1 && cp -a ~/$(basename $(xdg-user-dir DESKTOP))1/* /mnt/RAMDISK/desktop1/ 2> /mnt/RAMDISK/.nirvana
mkdir /mnt/RAMDISK/desktop2 && cp -a ~/$(basename $(xdg-user-dir DESKTOP))2/* /mnt/RAMDISK/desktop2/ 2> /mnt/RAMDISK/.nirvana
mkdir /mnt/RAMDISK/desktop3 && cp -a ~/$(basename $(xdg-user-dir DESKTOP))3/* /mnt/RAMDISK/desktop3/ 2> /mnt/RAMDISK/.nirvana
mkdir /mnt/RAMDISK/desktop4 && cp -a ~/$(basename $(xdg-user-dir DESKTOP))4/* /mnt/RAMDISK/desktop4/ 2> /mnt/RAMDISK/.nirvana
mkdir /mnt/RAMDISK/desktop5 && cp -a ~/$(basename $(xdg-user-dir DESKTOP))5/* /mnt/RAMDISK/desktop5/ 2> /mnt/RAMDISK/.nirvana
