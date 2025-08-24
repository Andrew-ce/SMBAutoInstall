#!/bin/bash
# Update system
apt-get update  && apt-get upgrade
# Install Packages
apt-get install samba rsync git
# Move updated config to /etc/samba and rename default
newsmbconfig=$(pwd)/smb.conf
cp /etc/samba/smb.conf /etc/samba/smb.conf.old
rsync -rltDvz smb.conf /etc/samba/smb.conf 
# Create SMB fileshare directory
mkdir -p /srv/samba/sharedir
# Create SMB user
/usr/sbin/useradd -M -s /sbin/nologin shareuser
passwd shareuser
smbpasswd -a shareuser
# Create SMB group
/usr/sbin/groupadd sharegroup
# Add shareuser to sharegroup
/usr/sbin/usermod -aG sharegroup shareuser
# Change sharedir ownership
chgrp -R sharegroup /srv/samba/sharedir
chmod 2770 /srv/samba/sharedir
#start service
systemctl start smbd 
