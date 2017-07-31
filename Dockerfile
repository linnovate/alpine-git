FROM alpine:3.6

# Important!  Update this no-op ENV variable when this Dockerfile
# is updated with the current date. It will force refresh of all
# of the base images and things like `apt-get update` won't be using
# old cached versions when the Dockerfile is built.
ENV REFRESHED_AT=2017-07-31 \
    LANG=en_US.UTF-8 \
    HOME=/opt/app

RUN echo "//////////////////// Creating home directory /////" && \
    mkdir -p $HOME && \
    echo "//////////////////////// Adding default user /////" && \
    adduser -s /bin/sh -u 1001 -G root -h $HOME -S -D default && \
    echo "///////// Setting home owner to default user /////" && \
    chown -R 1001:0 $HOME && \
    apk --update upgrade --no-cache && \
    echo "/////////////// Installing Git and Git deps  /////" && \
    apk add --no-cache git \
      openssh

WORKDIR $HOME

CMD ["/bin/sh"]
