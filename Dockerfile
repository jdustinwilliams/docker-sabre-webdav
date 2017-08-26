FROM php:7.1-alpine

COPY sabre /sabre
COPY run.sh /run.sh

ENV  UID=1001 \
     GID=1001

RUN  apk --no-cache --update add sudo && \
     mkdir /locks /webdav && \
     chmod a+rwx /locks /webdav && \
     chmod +x /run.sh

VOLUME ['/webdav', '/locks']

CMD /run.sh
