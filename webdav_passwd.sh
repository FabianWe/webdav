#!/bin/bash

# nginx basic auth support kind of sucks because there is no secure method
# implemented... however, this seems to work:
# https://security.stackexchange.com/questions/46883/is-every-hash-format-that-nginx-accepts-for-http-basic-auth-weak-against-brute-f
# so we somehow, by magic, get SHA-512

printf "Username: "
read USER

PASSWORD="$(mkpasswd -m sha-512)"

PASSWD="/webdav/htpasswd"

# Insert if entry does not exist, otherwise add new entry
# sed with the password format is a bit annoying, so actually we don't
# set the new password with sed, but delete the line and then insert again
# (maybe there is a better way, but who cares?)
sed -i "/^$USER:.*/d" "$PASSWD"
echo "$USER:$PASSWORD" >> "$PASSWD"

printf "Done\n"
