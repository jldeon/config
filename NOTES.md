# OpenVPN

Depending on what program maintains resolv.conf, the VPN config might need to be edited.
For systemd-resolved, the openvpn scripts aren't typically auto-installed:

```
sudo apt install openvpn-systemd-resolved
```

# Samba

For Windows compatibility and support of links to other file systems:

```
[global]

allow insecure wide links = yes
map archive = no
follow symlinks = yes
wide links = yes
```

It's possible to SSH tunnel Samba from Windows, but it's tricky:

https://www.nikhef.nl/~janjust/CifsOverSSH/Win10Loopback.html

(An easier route is a second, host-only LAN adapter through a virtualbox interface)

# GUI Minimization

```
sudo apt purge libreoff* firefox thunderbird
sudo apt install git vim keychain lxterminal sshfs
```

# Chrome

```
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb
```

# Sublime

```
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
sudo apt-get install apt-transport-https
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo apt-get update
sudo apt-get install sublime-text
```

# Quick tmux 3.0a

```
mkdir -p ~/bin/ && wget https://github.com/tmux/tmux/releases/download/3.0a/tmux-3.0a-x86_64.AppImage -O ~/bin/tmux && chmod u+x ~/bin/tmux
```


# Systemctl Auto Start

Reference:
- https://wiki.archlinux.org/index.php/Systemd/User
- https://wiki.archlinux.org/index.php/Systemd#Writing_unit_files

```
mkdir -p ~/.config/systemd/user/
vi ~/.config/systemd/user/$SERVICE_NAME.service
```

Contents of $SERVICE_NAME.service:
```
[Unit]
Description=Something Useful

[Service]
ExecStart=/usr/bin/my_command --args --no-daemon

[Install]
WantedBy=default.target
```


```
# Launch at startup, rather than on first login:
sudo loginctl enable-linger $USER
# Enable service to start on boot:
systemctl --user enable $SERVICE_NAME
# Start it now:
systemctl --user start $SERVICE_NAME
# Check output:
journalctl --user -u $SERCICE_NAME.service

```
