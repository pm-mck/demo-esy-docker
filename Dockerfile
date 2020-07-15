# syntax = docker/dockerfile:1.0-experimental
FROM ocaml/opam2:alpine-3.11-ocaml-4.10

USER root

ARG GLIBC_VERSION=2.31-r0

COPY build /tmp/build

RUN chmod 700 /tmp/build && \
    env \
    GLIBC_VERSION=${GLIBC_VERSION} \
    /tmp/build

COPY src /root/package/src
COPY package.json /root/package/package.json

WORKDIR /root/package

RUN --mount=id=demo_esy_docker1,target=/root/.esy,type=cache \
    --mount=id=demo_esy_docker2,target=/root/package/_esy,type=cache \
    esy i && esy b && \ 
    mv _esy/default/build/default/src/main.exe /main.exe

ENTRYPOINT "/main.exe"    