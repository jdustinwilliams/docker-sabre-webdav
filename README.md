# docker-sabre-webdav
WebDAV server based on sabre/dav

You can set following variables:

    UID=1001 # User id
    GID=1001 # Group id

If you want basic auth, use nginx/Traefik reverse proxy or make a pull request with that feature :P

Volumes:

    /webdav # WebDAV root
    /locks  # WebDAV locks db

Run this container:

    docker run --name=webdav -d -e UID=1001 -e GID=1001 -v ./webdav:/webdav -p 8080:8080 maksimkurb/sabre-webdav
