#!/bin/bash
./usr/sbin/sshd -D
service mysql start
sleep 10s
mysql mysql -e "CREATE DATABASE webdriver_test"
mysql < /skripte/testdb.sql
Xvfb :1 &
export DISPLAY=:1
export PATH=/firefox:$PATH
exec $@
