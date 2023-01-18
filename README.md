# unifiproxy
Dockerimage to run the .js files original created by
https://github.com/bahamas10/unifi-proxy/
in a docker environemnt

### Installation via command line
Install the docker container via command line:

```bash
docker pull haferm/unifiproxy
docker run --name ipxe -p 10001:10001 -v unifiproxy:unifiproxy haferm/unifiproxy
```

### Installation via docker compose
Install the docker container via docker compose:

```bash
version: "2.1"
services:
  unifiproxy:
    image: haferm/unifiproxy
    container_name: unifiproxy
    ports:
      - 10001:10001/udp
    volumes:
      - ./unifiproxy:/unifiproxy

    restart: unless-stopped
