#!/bin/sh

CONFIG=/etc/masakari/masakari.conf

test -f $CONFIG
[ $? -ne 0 ] && echo "no $CONFIG found! Check, that you mounted volume here." && exit 1
exec masakari-api
