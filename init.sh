#!/bin/bash 


cat /tmp/share.smb.conf >> /etc/samba/smb.conf

service samba start || exit 1

exit 0

