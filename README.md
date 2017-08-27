# Sabre WebDAV server
WebDAV server based on sabre/dav

This server works perfectly with non-latin characters in most cases.
[(Read more)](http://sabre.io/dav/character-encoding/) 

If you want basic auth, use [Traefik](https://hub.docker.com/_/traefik/) reverse proxy *or make a pull request with that feature :P*

### Environment variables:
```
# Use following variables to make correct permissions on webdav files:
UID=1001 # User id
GID=1001 # Group id
```


### Volumes:
```
/webdav # WebDAV root
/locks  # WebDAV locks db
```
### Running:
```
docker run --name=webdav -d -e UID=1001 -e GID=1001 -v ./webdav:/webdav -p 8080:8080 maksimkurb/sabre-webdav
```
### Example docker-compose.yml
```
version: '3'

services:
  webdav:
    build: .
    environment:
      - UID=10002
      - GID=10002
    volumes:
      - ./data:/webdav
    labels:
      - 'traefik.backend=webdav'
      - 'traefik.port=80'
      - 'traefik.frontend.rule=Host: dav.example.com'

  traefik:
    image: traefik
    command: --web --docker --docker.domain=example.com
    ports:
      - "80:80"
      - "8080:8080"
    labels:
      - 'traefik.backend=traefik'
      - 'traefik.port=8080'
      - 'traefik.frontend.rule=Host: traefik.example.com'
    volumes:
      - /var/run/docker.sock:/var/run/docker.sock
      - /dev/null:/traefik.toml
```
