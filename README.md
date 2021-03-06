# pywws-docker
[Docker Hub](https://hub.docker.com/r/matt2005/pywws/)

Provides a Docker image for pywws. Find out more about pywws here: https://github.com/jim-easterbrook/pywws

Based on Alpine Linux, which provides far leaner images (sub-100mb!)

Use `--privileged` to give access to USB devices (you should also be able to directly pipe your weather station's HID device into the container with `--device`, but it's untested!)

Test the connection like this:
```bash
docker run –-privileged matt2005/pywws pywws-testweatherstation
```

Following Jim's example using ~/weather/data, you can gather data onto your local file system like this:
```bash
docker run -–privileged -v ~/weather/data:/var/data matt2005/pywws pywws-livelog /var/data
```

Docker-compose example
```docker
version: "3"

services:
  pywws:
    container_name: pywws
    image: matt2005/pywws:latest
    privileged: true
    command:  ["pywws-livelog", "/var/data"]
    volumes:
      - '/etc/localtime:/etc/localtime:ro'
      - './pywws/weather/data:/var/data'
    devices:
      - '/dev/bus/usb/005/002'
    restart: unless-stopped
```
