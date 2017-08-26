#!/bin/sh

addgroup -g ${GID} webdav
adduser -D -H -u ${UID} -G webdav webdav
chown webdav:webdav /locks /webdav

# Run PHP server
cd /sabre
sudo -u webdav php -S 0.0.0.0:8080
