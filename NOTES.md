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
