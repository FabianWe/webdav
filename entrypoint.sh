#!/bin/bash

CONF="/webdav/default.conf"
if [ ! -e "$CONF" ]; then
  cp /default.conf "$CONF"
fi

PASSWD="/webdav/htpasswd"
if [ ! -e "$PASSWD" ]; then
  touch "$PASSWD"
fi

cp "$CONF" /etc/nginx/conf.d/
