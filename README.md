# SMBAutoInstall
SMBAutoInstall contains the files necessary to create a simple stand alone SMB shared directory on a local network. This was created for fresh installs on Debian systems. Any changes to SMB share users and directories must be made in the smb.conf and install_debian_smb.sh before running.
## Summary
### The install_debian_smb.sh script will automatically setup and start an SMB share with the user that's configured in the smb.conf of the current directory. Make all changes to the .conf file before running the script. This script assumes a fresh install and that you're elevated to su.


1. Make the script executable with the following:
```chmod +x install_debian_smb.sh```

2. Make any changes to smb.conf file before running the script, this will be the new samba config file.

3. Run the following as su:
```./install_debian_smb.sh```
