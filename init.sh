#!/bin/bash 

cat /tmp/share.smb.conf >> /etc/samba/smb.conf

service samba start || exit 1

tail -f /var/log/samba/log.smbd 

exit 0

