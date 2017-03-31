#!/bin/bash

# MIT License
# Copyright (c) 2017 Fabian Wenzelmann
#
# Permission is hereby granted, free of charge, to any person obtaining a copy of
# this software and associated documentation files (the "Software"), to deal in
# the Software without restriction, including without limitation the rights to use,
# copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the
# Software, and to permit persons to whom the Software is furnished to do so,
# subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
# FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
# COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
# IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
# CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

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
