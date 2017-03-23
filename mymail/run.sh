#!/bin/bash

#useradd -d /home/test -m test
useradd -d /home/test -m test
echo "test:test" | chpasswd


/usr/sbin/dovecot


/usr/sbin/postfix start



source /etc/apache2/envvars

if [ -f "$APACHE_PID_FILE" ]; then
	rm "$APACHE_PID_FILE"
fi

/usr/sbin/apache2ctl -D FOREGROUND
