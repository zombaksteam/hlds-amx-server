# HL 1.6 Server Amx Base

This is AmxModX base image for pure clear Half-Life 1.6 server with AmxModX

Docker image: [https://hub.docker.com/repository/docker/zombaksteam/hl-amx-server](https://hub.docker.com/repository/docker/zombaksteam/hl-amx-server)

## How to test image

```bash
docker run --rm \
 --network host \
 --name hl-amx-server-test \
 -e HL_SERVER_IP="127.0.0.1" \
 -e HL_SERVER_PORT="27015" \
 -v /etc/timezone:/etc/timezone:ro \
 -it zombaksteam/hl-amx-server:latest
```

## How to run server

```bash
docker run -d \
 --network host \
 --restart=always \
 --name hl-amx-server \
 -e HL_SERVER_IP="127.0.0.1" \
 -e HL_SERVER_PORT="27015" \
 -v /etc/timezone:/etc/timezone:ro \
 -v /host-server/logs/:/home/steam/server/valve/addons/amxmodx/logs/ \
 -it zombaksteam/hl-amx-server:latest
```

## How to attach to console

```bash
docker attach --detach-keys="ctrl-a,c" hl-amx-server
```

## How to dettach from console

Simple press `Ctrl+A` and then `C`

## ENV config variables

```bash
HL_SERVER_IP   # Public server IP
HL_SERVER_PORT # Public server port
HL_SERVER_MAP  # Server start map
SYS_TICRATE    # Server ticrate
NUM_EDICTS     # Server num edicts
MAXPLAYERS     # Server max players
```
