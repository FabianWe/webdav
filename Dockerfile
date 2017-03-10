FROM ubuntu:16.04
MAINTAINER Fabian Wenzelmann <fabianwen@posteo.eu>

# whois is required for mkpasswd
RUN apt-get update && apt-get install -y nginx nginx-extras whois

# COPY webdav.conf /default.conf
# COPY webdav.conf /etc/nginx/conf.d/default.conf

VOLUME /media
VOLUME /webdav

COPY webdav.conf /default.conf

RUN rm /etc/nginx/sites-enabled/*

COPY entrypoint.sh /
RUN chmod +x entrypoint.sh
COPY webdav_passwd.sh /
RUN chmod +x /webdav_passwd.sh
EXPOSE 80

CMD /entrypoint.sh && nginx -g "daemon off;"
