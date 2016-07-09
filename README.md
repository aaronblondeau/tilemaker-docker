# tilemaker-docker
A Docker image for running tilemaker : [https://hub.docker.com/r/ablondeau/tilemaker/](https://hub.docker.com/r/ablondeau/tilemaker/)

## Running the container

1) Create a directory to work in (ie ~/Downloads/tmtest)

2) Place the .osm.pbf file in your working directory (ie ~/Downloads/tmtest/colorado-latest.osm.pbf)

3) Prepare a config.json and a process.lua file in your working directory.  See https://github.com/systemed/tilemaker/blob/master/CONFIGURATION.md

4) Run tilemaker with

```
docker run --name tilemaker -v ~/Downloads/tmtest:/opt/tilemaker -it ablondeau/tilemaker tilemaker colorado-latest.osm.pbf --output=tiles/
```

## Building and running locally

See comments at the top of the Dockerfile.
