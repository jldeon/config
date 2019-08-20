start /b cmd /c "C:\Program Files\VcXsrv\vcxsrv.exe" :0 -wgl -dpi auto -ac -multiwindow
timeout 10
wsl bash -c "cd $HOME ; DISPLAY=localhost:0 lxterminal"
start /b cmd /c "C:\Program Files\Oracle\VirtualBox\VBoxManage.exe" startvm "build-vm" --type headless
