#!/bin/sh

docker rm -f masakari-api 1>&2> /dev/null

docker run \
  -d \
  -v /etc/masakari/:/etc/masakari/ \
  --name masakari-api \
  odivlad/masakari:api
