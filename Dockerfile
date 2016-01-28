FROM gliderlabs/alpine:3.3
MAINTAINER Jeroen Geusebroek <me@jeroengeusebroek.nl>

ENV PACKAGE_LIST="znc znc-extra sudo" \
    REFRESHED_AT='2015-01-21'

RUN apk add --no-cache ${PACKAGE_LIST} && \

	# Delete standard ZNC user so we can use any UID/GID we like.
	deluser znc

VOLUME [ "/config" ]

ADD ./entrypoint.sh /entrypoint.sh
RUN chmod u+x  /entrypoint.sh

EXPOSE 1337/tcp

ENTRYPOINT [ "/entrypoint.sh" ]
CMD [ "" ]