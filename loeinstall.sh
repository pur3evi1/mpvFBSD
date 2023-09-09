#!/bin/tcsh

# Runs winecfg to generate wine config files, then makes edits to add X11 Driver under Wayland.
# X11 Drivers config is needed so that wine Unity windows take back focus.
# Sets dxgi to native,builtin for wine to use ReShade.
wine64 winecfg & 
sleep 9 && pkill wine64 && sleep 3 && sed -i -E '/Volatile Environment/s/^/\[Software\\\\Wine\\\\X11\ Driver\]\ 1694149514\n\"GrabFullScreen\"\=\"Y\"\n\"UseTakeFocus\"\=\"N\"\n\n/;/\\Shell\ Folder/s/^/\[Software\\\\Microsoft\\\\Windows\\\\CurrentVersion\\\\Applets\\\\Regedit\]\ 1694149565\n\"LastKey\"\=\"HKEY\_CURRENT\_USER\\\\Software\\\\Wine\\\\X11\ Driver\"\n/;/\\Fonts\]/s/^/\"dxgi\"\=\"native\,builtin\"\n\n/' ~/.wine/user.reg 

# Gets the newest version of Legends of Equestria by getting the mega.nz link from the site,
# then uses megatools to download.
megadl `curl -s https://www.legendsofequestria.com/downloads | grep x64 | cut -d'"' -f2` && unzip $PWD/legends*ip 
rm $PWD/legends*ip 

# Gets ReShade and moves required files to game directory. 
curl https://reshade.me/`curl https://reshade.me/ | grep -v Addon | grep exe | cut -d'"' -f2 | tail -c +2` -o ReShade.exe 
unzip Re*xe 
cp ~/.wine/drive_c/windows/system32/d3dcompiler_47.dll ~/LoE/ 
cp ReS*4.dll ~/LoE/dxgi.dll 
rm ReShade*

# Disables chat filter locally so I can say 'gay' and sing All Star with 
# friends and see people call me slurs.
wine64 ~/LoE/loe.exe & 
sleep 10 && wineserver -k 
echo "" > ~/.wine/drive_c/users/sure/AppData/LocalLow/LoE/Legends\ of\ Equestria/ChatFilterStrict.txt && echo "" > ~/.wine/drive_c/users/sure/AppData/LocalLow/LoE/Legends\ of\ Equestria/ChatFilterBlocked.txt
