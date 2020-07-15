#!/bin/bash
/usr/local/squid/libexec/security_file_certgen -c -s /usr/local/squid/var/logs/ssl_db -M 16MB
chmod o+w /usr/local/squid/var/logs/cache.log
chown -R proxy.proxy /usr/local/squid
/usr/local/squid/sbin/squid -f /usr/local/squid/etc/squid.conf
cc
