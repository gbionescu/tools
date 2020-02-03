Docker container for virt-manager 1.5.1 based on Ubuntu 16.04

###### Build
docker build -t <name> .

###### Run
No entry point defined, but vmanager is deployed in /vmanager:
```
docker run -it --rm \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -e DISPLAY=unix$DISPLAY \
    <name> /vmanager/virt-manager
```
