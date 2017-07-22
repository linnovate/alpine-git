#!/bin/sh

REPO=muhifauzan/alpine-git
REFRESHED_AT=$(cat REFRESHED_AT)

docker build \
       --force-rm \
       --build-arg REFRESHED_AT=$REFRESHED_AT \
       -t ${REPO}:latest \
       .

docker push ${REPO}:latest
