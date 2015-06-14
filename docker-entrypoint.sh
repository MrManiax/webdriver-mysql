#!/bin/bash
./usr/sbin/sshd -D
service mysql start
sleep 10s
Xvfb :1 &
export DISPLAY=:1
export PATH=/firefox:$PATH
exec $@
