Volumes: 
- `<path to your config>:/prefix32/drive_c/users/root/Local Settings/Application Data/Amazon/Kindle`
- `<path to your downloads>:/root/prefix32/drive_c/users/root/My Documents/My Kindle Content`
- `<path to your kindle keys>:/root/kindlekeys/`


```
kindle-gui:
    image: ghcr.io/shuaiscott/kindle-gui
    container_name: kindle-gui
    restart: always
    ports:
      - 8080:8080
    volumes:
      - "./kindle-gui/config:/root/prefix32/drive_c/users/root/Local Settings/Application Data/Amazon/Kindle"
      - "./kindle-gui/keys:/root/kindlekeys/"
      - "/data/downloads/books:/root/prefix32/drive_c/users/root/My Documents/My Kindle Content"
```

```
docker-compose up -d
docker exec -it kindle-gui sh grabKindleKey.sh
```
## wine-x11-novnc-docker

Not a very good name, is it?

Ever wanted to containerize your wine applications and access them via
a web browser? No? Neither did I!

This container runs:

* Xvfb - X11 in a virtual framebuffer
* x11vnc - A VNC server that scrapes the above X11 server
* [noNVC](https://kanaka.github.io/noVNC/) - A HTML5 canvas vnc viewer
* Fluxbox - a small window manager
* Explorer.exe - to demo that it works

This is a [trusted build](https://registry.hub.docker.com/u/solarkennedy/wine-x11-novnc-docker/)
on the Docker Hub.

## Run It

    docker run --rm -p 8080:8080 solarkennedy/wine-x11-novnc-docker
    xdg-open http://localhost:8080

In your web browser you should see the default application, explorer.exe:

![Explorer Screenshot](https://raw.githubusercontent.com/solarkennedy/wine-x11-novnc-docker/master/screenshot.png)

## Modifying

This is a base image. You should fork or use this base image to run your own
wine programs?

## Issues

* Wine could be optimized a bit
* Fluxbox could be skinned or reduced
