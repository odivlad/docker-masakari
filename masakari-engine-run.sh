#!/bin/sh

docker rm -f masakari-engine 1>&2> /dev/null

docker run \
  -d \
  -v /etc/masakari/:/etc/masakari/ \
  --name masakari-engine \
  odivlad/masakari:engine
