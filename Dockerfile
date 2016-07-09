# Build with
# docker build -t tilemaker .

# Shell into with
# docker run --name tilemaker -it tilemaker /bin/bash

# To run
# 1) Create a directory to work in (ie ~/Downloads/tmtest)
# 2) Place the .osm.pbf file in your working directory (ie colorado-latest.osm.pbf)
# 3) Prepare a config.json and a process.lua file in your working directory.  See https://github.com/systemed/tilemaker/blob/master/CONFIGURATION.md
# 4) Run tilemaker with
# docker run --name tilemaker -v ~/Downloads/tmtest:/opt/tilemaker -it tilemaker tilemaker colorado-latest.osm.pbf --output=tiles/

FROM ubuntu:16.04
MAINTAINER Aaron Blondeau <aaronblondeau@gmail.com>

RUN apt-get update -y && \
    apt-get install -y git build-essential liblua5.1-0 liblua5.1-0-dev libprotobuf-dev libsqlite3-dev protobuf-compiler shapelib libshp-dev libboost1.58-all-dev  && \
    git clone https://github.com/rpavlik/luabind.git && \
    cd luabind && \
    ln -s /usr/lib/x86_64-linux-gnu/liblua5.1.so /usr/lib/ && \
    bjam install && \
    ln -s /usr/local/lib/libluabindd.so /usr/local/lib/libluabind.so && \
    ldconfig && \
    cd && \
    git clone https://github.com/systemed/tilemaker.git && \
    cd tilemaker/ && \
    make && \
    make install && \
    mkdir /opt/tilemaker && \
    mkdir /opt/tilemaker/tiles

VOLUME /opt/tilemaker
WORKDIR /opt/tilemaker
