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

So far for today's history lesson.


===================================================================


 So, how does it work?

 
 rdw uses a RAM disk to avoid performance problems and to reduce wear and tear of disks when changing desktops.
 
 You should be able to read the way it works from the code and the inline comments. The first script rdw_boot_git.sh
 prepares everything at startup (copies wallpapers and desktop data to RAM disk).

 If not, decide if you want to wait until this  section is completed or if you trust me and want to use it anyway
 without knowing what it does.

 It should be totally safe - but wait !

   If you save files to the desktop like I do now and then,
    be aware to change the workspace once before shutdown,
    otherwise these files might be lost.
    (This is because at boot you always start with workspace 0,
     and there is only one standard desktop. Chances you have been
     on workspace 0 before shutdown is "1 : number_of_workspaces".)

 Do not save very large files on your desktop (like ISOs), excessive 
 file sizes might cause problems when switching workspaces fast
 (while my tests with up to 128MB were okay).

 Good Bernhard from my Frankfurt, Germany LUG told me the REPLY command (see above, or in rdw_git.sh) needs attention because it only supports up to 10 workspaces.
 That's absolutely true. I will change that in the furture after having this first upload done and its doumentation has been tested.
 
 ...
 ... to be enhanced.
 ...

 I use willurd's Cinnamon applet "workspace-name" (in the default list) and it works perfectly with this script.

===================================================================================================================================================================



Let's install.


First steps:

1. Prepare as many wallpapers as you will need (one per workspace!) name in folder ~/Wallpaper (named 1.jpg, 2.jpg, ... you got it).

2. Open Cinnamon's themes dialogue and maybe folder /usr/share/themes to have a list of themes you want to use (at least your standard one).

3. Copy both scripts and this readme into your favorite script folder.

4. create a RAM disk, e.g. /mnt/RAMDISK by editing /etc/fstab with

   sudo xed /etc/fstab

   to add a corresponding entry:

#RAMDISK
tmpfs                                       /mnt/RAMDISK    tmpfs  rw,nosuid,nodev,size=512m   0  0

3. Make both scripts executable. Uuse the chmod command or use nemo and change the files properties.

4. Create an autostart entry to execute "rdw_boot_git.sh" from your favorite script folder at boot, a delay of 3 secs might be okay.

5. Create an autostart entry to execute "rdw_boot.sh" your favorite script folder at boot, give it a slightly bigger delay so that it starts after the first script is done.

6. Open your favorite script folder.

7. Edit "rdw_boot_git.sh" to add "cp" and "mkdir" command lines if you use more than six workspaces. Be aware changing the wallpaper name (if you want to) and the one respectively three occurences of the number of the desktop. You don't need to delete extra entries if you use less workspaces but need at least one entry per workspace.

8. Save and close the file.

9. Edit "rdw_boot.sh" to add wallpaper/theme entries in the corresponding arrays if you use more than six workspaces. Be aware changing the wallpaper and theme names (if you want to). You don't need to delete extra entries if you use less workspaces but need at least one entry per workspace. You do not hyve to change code after the =============== block.

10. Save and close the file.

11. reboot.

Enjoy.
