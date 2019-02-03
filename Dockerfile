FROM alpine:latest
LABEL maintainer="Jeroen Geusebroek <me@jeroengeusebroek.nl>"

ENV PACKAGE_LIST="znc znc-extra sudo ca-certificates"

RUN apk add --no-cache ${PACKAGE_LIST} && \
	deluser znc

VOLUME [ "/config" ]

ADD ./entrypoint.sh /entrypoint.sh
RUN chmod u+x  /entrypoint.sh

EXPOSE 1337/tcp

ENTRYPOINT [ "/entrypoint.sh" ]
CMD [ "" ]