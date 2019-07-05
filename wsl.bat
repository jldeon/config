start /b cmd /c "C:\Program Files\VcXsrv\vcxsrv.exe" :0 -wgl -dpi auto -ac -multiwindow
timeout 10
wsl bash -c "cd $HOME ; DISPLAY=localhost:0 nohup lxterminal >/dev/null 2>&1 &"
start /b cmd /c "C:\Program Files\Oracle\VirtualBox\VBoxManage.exe" startvm "build-vm" --type headless
