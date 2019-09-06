#!/bin/bash

if [[ $# != 2 ]]; then
    echo "Illegal parameters. Parameter 1: [user]; Parameter 2: [/AbsolutePathOfSharedFolder]."
    exit 1
fi

hash smbd 2>/dev/null || { echo >&2 "smbd is not installed.  Aborting."; exit 1; }

echo "set smbd password for the user: "$1
smbpasswd -a $1

name=`echo $2 | awk -F\/ '{print $NF}'`

cat <<EOT >> /etc/samba/smb.conf
[$name]
path = $2
available = yes
valid users = $1
read only = no
browsable = yes
public = yes
writable = yes
EOT

service smbd restart

echo "Now you can create a shortcut on Windows, fill \"\\\\[ip]\\$name\" to enter the shared folder from Windows."
