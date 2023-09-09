# mpvFBSD
FreeBSD is a great desktop and laptop OS if your hardware is supported.
I prefer to run it in a way were I use tty and tiling Wayland compositors interchangeably. This is because it uses up less energy on laptops to run simple framebuffer ttys, and partially because I'm a minimalist. To do this reasonably, I use scrapers and mpv, which can display images and videos in tty. It can also play audio, which FreeBSD handles out of the box, using the mixer command to set volume.

To install FreeBSD, go to the downloads: https://www.freebsd.org/where/
Furst, check the checksums to make sure your FreeBSD image wasn't tampered with by getting the checksum from multiple sources, and run: 
sha256sum -c CHECKSUM FreeBSD.iso
Once you get OK, you're safe to burn the image you chose to a CD or use dd to transfer the iso to a USB flash drive. On Linux, you can use fdisk -l among other commands to find out what drive is the flash drive, then use
dd if=/path/to/FreeBSD.iso of=/dev/sd* bs=1M conv=sync status=progress
to burn it. Run this as root with sudo or doas, or su if you want.
If on Windows, then I personally prefer BalenaEtcher: https://etcher.balena.io/

Get the contents of this repo and store it somewhere else, like on another flash drive.

Now go into your UEFI or BIOS. Look up the brand and BIOS. You normally have to press Esc, F2, Del, or something like repeatedly when turning the computer on to get the UEFI or BIOS. Note the name of your drive and if your system time is set to UTC or local. If you were on Linux and were not dual booting, then it was probably set to UTC, however, if you're on Windows, then your computer was probably set to local time.
Optionally note if you have UEFI or BIOS, for you can change a setting in the disk section later if you know it.

Install:
The US keymap is the default so if you're used to that then you can just hit enter, othewise, pick your keyboard.

It's suggested but not required to make up a fake domain name to put as your hostname, e.g. 'homedesk.twoplustwoisfish.homedomain'. You could name your computer a simple 'fish' if you want.

Go down to ports and select it. Once you do this kernel-dbg, lib32, and ports should all show an asterisk (*). If you want, you can also select src.

If your computer supports it, then use ZFS. It will use up some memory/RAM, but not much. Swap "Encrypt Disks?" and "Encrypt Swap" both to YES. At minimum give the swap size the same size as the amount of RAM you have plus 1 GB, if you have like 16 GB. If less, I suggest putting a lot more of your drive into swap, around 2.4 times the RAM plus 1 GB should be fine. You can mirror if you want to and have the drive space for it.
Select the drive you want to install onto, stripe on desktop or laptop's disk. Use spacebar to select the disk. Be careful to select your actual disk and not something else! Once done, select Proceed. Give it a strong password as all of your drive's contents are behind it. You can use random words and make up a story to remember it, keepassxc has a tool to generate random word passwords.

Create another strong password. Preferably use numbers, letters of both capital and lowercase, symbols, whatever you can. You can also use random words for this, but I highly suggest not making it entirely out of words.

Skip network configuration for now. We'll start that back up with bsdconfig after rebooting.

Pick your location. If you're in the USA you'll have to pick America and go down quite a bit. Look up the time zones if you don't know them and get the exact correct one. This is very important for encryption to work with the internet. 

If you never use ssh, disable sshd, if you do use it, then set it up to securely use keys later. You must get ntpdate and ntpd. If you're on a laptop, I suggest getting powerd. If you have a touchpad or mouse select moused (if such an input device is detected, it will be started anyway). It allows you to copy and paste things via highlighting them then using middle click to paste. Do not select local_unbound if you're not going to configure it.

At hardening, select everything, then move on.

Select your user. Hit enter on 'Uid' and 'Login group'. When asked for other groups, list off 'wheel video tty'. Enter on 'Login class'. Type in tcsh for shell. Enter on 'Home directory' and 'Home directory permissions'. Yes yes yes until you get to setting your own password. Set a password that is **uniqe from your root password**. If you don't, your system is much less secure. No to 'Lock out' and to 'Add another' user.

Exit, selecting to make final changes. Put whatever disk or flash drive you have the contents of this repo on into the computer, then do geom disk list. If it's a flash drive you can mount it. Make a directory with mkdir -p and then mount it to that dir with mount_msdosfs /dev/disk /mountpoint.
Once you have the files, copy pf.rules into /usr/share/security/pf.rules and cat the rc.conf into /etc/rc.conf with cat rc.conf >> /etc/rc.conf. > means replace the file instead of add to the end, so be certain to get >>. Once you've done this type 'exit' to reboot.

Run bsdconfig to set up internet and DNS, I suggest using 9.9.9.9 and 149.112.112.112.
Now run setup.sh as root.

Now you're done. You can run sway or get scrapers with cargo.
