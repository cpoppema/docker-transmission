**WARNING** - This image for Transmission is from before [linuxserver.io](https://github.com/linuxserver) had one, but now they [do](https://github.com/linuxserver/docker-transmission/)! If you can, use theirs instead to show your support so they can keep making awesome containers.

# cpoppema/docker-transmission

[Transmission](http://www.transmissionbt.com/about/) is a cross-platform open source BitTorrent client.

## Usage

```
docker create \
    --name=transmission \
    -p 9091:9091 \
    -e PGID=<gid> -e PUID=<uid> \
    -v </path/to/transmission/appdata>:/config \
    -v <path/to/downloads>:/downloads \
    cpoppema/docker-transmission
```

This container is based on phusion-baseimage with ssh removed. For shell access whilst the container is running do `docker exec -it transmission /bin/bash`.

**Parameters**

* `-p 9091` - Transmission WebUI Port
* `-v /config` - Transmission app data
* `-v /downloads` - location of downloads on disk
* `-e PGID` for GroupID - see below for explanation
* `-e PUID` for UserID - see below for explanation

### User / Group Identifiers

**TL;DR** - The `PGID` and `PUID` values set the user / group you'd like your container to 'run as' to the host OS. This can be a user you've created or even root (not recommended).

Part of what makes this container work so well is by allowing you to specify your own `PUID` and `PGID`. This avoids nasty permissions errors with relation to data volumes (`-v` flags). When an application is installed on the host OS it is normally added to the common group called users, Docker apps due to the nature of the technology can't be added to this group. So this feature was added to let you easily choose when running your containers.

## Updates / Monitoring

* Upgrade to the latest version of Transmission simply `docker restart transmission`.
* Monitor the logs of the container in realtime `docker logs -f transmission`.

**Credits**
* [linuxserver.io](https://github.com/linuxserver) for providing awesome docker containers.
