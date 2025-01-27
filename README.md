# rdw
really different workspaces (for Cinnamon with X)

Use different
- wallpapers,
- themes and
- selections of desktop links and files
on every workspace you have setup.

It began with my wish to have a simple wallpaper changer -
not the usual, playful one which periodically exchanges your current wallpaper.

What I wanted wasn one wallpaper per workspace I use, a dark one for movies or youtube,
one with a bash cheat sheet for system maintainance, one with a picture of some relevant notes
to always see what I'm doing (or more to concentrate on that).

There was a script called I found somewhere to do exactly that, I think it was called "wdis".
It must be 10+ years ago, the pandemic reset my longtime memory...) containing the essential 

xprop -root -spy _NET_CURRENT_DESKTOP | (
   while read -r; do
      desk=${REPLY:${#REPLY}-1:1}
      setdesktop ${desktop_img[$desk]}
   done)

No idea where this comes from, and can't be found anymore (it's not from the Linux Mint forum entry by dj1s).
I never intended to redistribute it so I didn't save the original file, but after my enhancements used asked for it.


However, I use links on my desktop for folders and files, even text files and pdfs are gathered here (at least temporarely).
With a formerly clutter of 50-60 links of all kinds, and music, movie and clip links don't matter during working hours,
i came up with "Why don't you separate them onto their designated environments?".
Now I have four links on my main workspace, up to eight on others, and on my development workspace.

After adding the feature of separated sets of icons, changing the themes per desktop was a mere gimmick, mainly as proof of concept.



First steps:
1. create a RAM disk, e.g. /mnt/RAMDISK
2. edit /etc/fstab  (sudo xed /etc/fstab)  to add a corresponding entry:
#RAMDISK
tmpfs                                       /mnt/RAMDISK    tmpfs  rw,nosuid,nodev,size=512m   0  0
"3. reboot.

4. copy 
5. 


