#!/bin/sh

UID=${UID:-911}
GID=${GID:-911}

groupmod -o -g "$GID" webdav
usermod -o -u "$UID" webdav

echo "
User UID: $(id -u webdav)
User GID: $(id -g webdav)
"

if [ ! "$(stat -c %u /webdav)" = "${UID}" ]; then
    echo "Ownership of webdav root changed. Changing owner recursively (may take some time)..."
	chown webdav:webdav -R /webdav
fi

chown -R webdav:webdav /locks

echo "Starting Apache2..."
httpd -D FOREGROUND
