[![](https://images.microbadger.com/badges/image/jgeusebroek/znc.svg)](https://microbadger.com/images/jgeusebroek/znc "Get your own image badge on microbadger.com")
[![](https://img.shields.io/docker/pulls/jgeusebroek/znc.svg)](https://hub.docker.com/r/jgeusebroek/znc/)
# Docker ZNC image

A tiny image running [Alpine Linux](https://alpinelinux.org/) and [ZNC](http://wiki.znc.in/ZNC) with basic modules.
Need custom module support? Have a look at [jimeh/znc](https://github.com/jimeh/docker-znc).

## Usage

If you do not yet have a ZNC configuration make sure you run this container interactive the first time, with the argument: `--makeconf`

	docker run --rm -ti \
		-p 0.0.0.0:1337:1337 \
		--hostname=znc \
		--name=znc \
		-v /<host_directory_to_share>:/config \
		jgeusebroek/znc \
		-- makeconf

When you complete the configuration, you can exit the container with `ctrl-c` and you are ready to run it as a daemon.

	docker run --restart=always -d \
		-p 0.0.0.0:1337:1337 \
		--hostname=znc \
		--name=znc \
		-v /<host_directory_to_share>:/config \
		jgeusebroek/znc

## Optional environment variables

* `USER_UID` User ID of the ZNC account (default: 2001).
* `USER_GID` Group ID of the ZNC account (default: 2001).

## License

MIT / BSD

## Author Information

[Jeroen Geusebroek](https://jeroengeusebroek.nl/)
