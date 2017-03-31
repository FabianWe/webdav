# fabianwe/webdav

This is a docker image for a simple webdav server using nginx and basic auth. It was inspired by [sashgorokhov/docker-nginx-webdav](https://github.com/sashgorokhov/docker-nginx-webdav). However I added some support for multiple users and use SHA-512 for password ecnryption.

## Usage
Here is a docker-compose file that shows you how to use it, if you don't use docker-compose I think you will still be able to figure it out.

```yml
version: '2'

services:
  webdav:
    image: fabianwe/webdav
    volumes:
      - ./media:/webdav_media
      - ./webdav_conf:/webdav
    expose:
      - "80"
```

## Add a User / Change User password
To add a user or change a user password execute the script `/webdav_passwd.sh` in the container.
In the example above:
```bash
docker-compose exec webdav /webdav_passwd.sh
```
You'll be promted for the username and password.

# License
MIT License
Copyright (c) 2017 Fabian Wenzelmann

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
