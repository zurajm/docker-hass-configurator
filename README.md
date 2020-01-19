# hass-configurator-docker
Linux x32/64 and ARM (raspberry) builds for the hass-configurator

![Docker Cloud Build Status](https://img.shields.io/docker/cloud/build/zurajm/hass-configurator?style=flat-square)
![Docker Pulls](https://img.shields.io/docker/pulls/zurajm/hass-configurator?style=flat-square)
![Docker Stars](https://img.shields.io/docker/stars/zurajm/hass-configurator?style=flat-square)

Based on Alpine, image size only:

![MicroBadger Size](https://img.shields.io/microbadger/image-size/zurajm/hass-configurator)

## Usage

Example docker-compose.yaml
```yaml
  hass-configurator:
    image: "zurajm/hass-configurator"
    restart: always
    ports:
      - "3218:3218/tcp"
    networks:
      - hass-network
    volumes:
      - "./data/configurator-config:/config"
      - "./data/config:/hass-config"
```
Please remember to change the tag to your architecture

#### Configuration
Be sure to map the config folder of your homeassistant instance to the configurator container and set the `basepath` in your configuration.
The configuration needs to be mapped to `/config` and needs to be named `settings.conf`.

As with Verion 0.3.3 it is also possible to use environment vars to set configurations but you will still need your hass-config folder mapped into the container.

#### GIT Integration

In order to use the git integration with hass-configurator you have to use one of the following options.

1. Mount the ssh files
```yaml
  hass-configurator:
    volumes:
      - "/path/.ssh/id_rsa:/root/.ssh/id_rsa:ro"
      - "/path/.ssh/id_rsa.pub:/root/.ssh/id_rsa.pub:ro"
      - "/path/.ssh/known_hosts:/root/.ssh/known_hosts:rw"
```

2. Use the https version with an github token
```
https://<github username>:<some token>@github.com/<github username>/<some repo>.git
```

#### DockerHub Tag
As with version 0.3.3 the pattern of the docker image was changed to use semver, for backwards compatibility version 0.3.3 will have both versions up in the docker hub
As with version 0.3.3 2018-12-23 there is also an ARCH only tag on docker hub marking an image as "latest" for the specific ARCH

## Links

- Original Repository by [CausticLab](https://github.com/CausticLab/hass-configurator-docker)
- Docker Images are on [Docker hub](https://hub.docker.com/repository/docker/zurajm/hass-configurator)
- The corresponding [Github repository](https://github.com/zurajm/docker-hass-configurator)
