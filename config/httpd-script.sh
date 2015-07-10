#!/bin/bash

# Make sure we're not confused by old, incompletely-shutdown httpd
# context after restarting the container.  httpd won't start correctly
# if it thinks it is already running.

VAR_DNS="nameserver 192.168.10.248 \nnameserver 192.168.10.249  \nnameserver 8.8.8.8"
printf "${VAR_DNS}" > /etc/resolv.conf

rm -rf /run/httpd/* /tmp/httpd*

exec /usr/sbin/httpd -D FOREGROUND

