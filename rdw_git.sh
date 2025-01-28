#!/bin/bash
# really different workspaces
# © 2024 cinnamon_rdw@mideal.de
#
# Script to set 
#   - different wallpapers per workspace
#   - different sets of icons per workspace
#   - different themes per workspace
# when switching workspace, no matter if
#   - per keystroke,
#   - per command or
#   - per switching applet.
# 
# Set it as autostart and ENJOY REALLY DIFFERENT WORKSPACES!
# 
# Tested on Linux Mint 22.1 'Cinnamon Xia' (works on previous editions to).
# 
# Prerequisites:
#   - you must be running Xorg
#   - you must have "xdotool" installed.
# 

# full path to images directory
# define your wallpaper folder and files here
# choose different wallpapers for two monitor setup if you like
# add more images if using more workspaces - minimum the number of workspaces
Wallpaper=/mnt/RAMDISK/Wallpaper
wallpaper=(
 "${Wallpaper}/1.jpg"     # Wallpaper for workspace 0
 "${Wallpaper}/2.jpg"     # Wallpaper for workspace 1
 "${Wallpaper}/3.jpg"     # Wallpaper for workspace 2
 "${Wallpaper}/4.jpg"     # Wallpaper for workspace 3
 "${Wallpaper}/5.jpg"     # Wallpaper for workspace 4
 "${Wallpaper}/6.jpg"     # Wallpaper for workspace 5
 )

# choose the themes for your workspaces here - minimum the number of workspaces defined
# 
theme=(
 "Mint-X-Red"
 "Mint-Y-Blue"
 "Papirus"
 "Mint-X-Blue"
 "Mint-Y-Red"
 "Mint-L-Teal"
 )

# ==========================================================================
# ==========================================================================
# ==========================================================================

# get current desktop and set as "previous" for future switches
prev=$(xdotool get_desktop)

# switch to first workspace
#xdotool set_desktop 0

gsettings set org.nemo.desktop use-desktop-grid false

# function to set wallpaper to workspace switched to
setdesktop() {
#               echo "von ${prev} nach ${desk}"
               ### move icons and stuff to ~/$(basename $(xdg-user-dir DESKTOP))_${prev}
               cp -a -backup=t ~/$(basename $(xdg-user-dir DESKTOP))/* /mnt/RAMDISK/desktop${prev}/ 2>/mnt/RAMDISK/.nirvana

               ### && delete icons from ~/$(basename $(xdg-user-dir DESKTOP))
               rm -rfd ~/$(basename $(xdg-user-dir DESKTOP))/*

               ### copy desktop metadata, too,for next workspace
               cp -a   /home/dirk/.config/nemo/desktop-metadata ~/.config/nemo/desktop-metadata${prev}

               ### copy dconf/user metadata, too, for next workspace
               cp -a   /home/dirk/.config/dconf/user ~/.config/dconf/user${prev}

               ### restore desktop metadata, too,for next workspace
               cp -a   /home/dirk/.config/nemo/desktop-metadata${desk} ~/.config/nemo/desktop-metadata

               ### restore dconf/user metadata, too,for next workspace
               cp -a   /home/dirk/.config/dconf/user${desk} ~/.config/dconf/user

               ### && copy icons from ~/$(basename $(xdg-user-dir DESKTOP))_${desk} mit -prs oder -prl?
               cp -a /mnt/RAMDISK/desktop$desk/* ~/$(basename $(xdg-user-dir DESKTOP))/ 2>/mnt/RAMDISK/.nirvana

               ### set wallpaper
               gsettings set org.gnome.desktop.background picture-uri "file://${wallpaper[$desk]}"

               ### set Theme
               gsettings set org.cinnamon.desktop.interface icon-theme "${theme[$desk]}"

               ### save from RAMDISK-prev in real desktop folder-prev
               cp -a -backup=t /mnt/RAMDISK/desktop${prev}/*  ~/$(basename $(xdg-user-dir DESKTOP))${prev}/ 2>/mnt/RAMDISK/.nirvana

               ### set current desktop as "previous" for future switches
               prev=${desk}

             }


xprop -root -spy _NET_CURRENT_DESKTOP | (
   while read -r; do
      desk=${REPLY:${#REPLY}-1:1}
      if [ ${desk} != ${prev} ]; then 
         setdesktop
      fi        
   done
   )

#### ~/desktop general name:
#### ~/$(basename $(xdg-user-dir DESKTOP))

