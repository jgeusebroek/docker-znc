#!/bin/sh
set -x

USERNAME=${USERNAME:=znc}
GROUP=${GROUP:=znc}

# Add user if it does not exist
if ! id -u "${USERNAME}" >/dev/null 2>&1; then
	addgroup -g ${USER_GID:=2001} ${GROUP}
	adduser -G ${GROUP} -D -u ${USER_UID:=2001} ${USERNAME}
fi

chown -R ${USERNAME}:${GROUP} /config
sudo -u ${USERNAME} -E sh -c "znc -f -d /config $@"