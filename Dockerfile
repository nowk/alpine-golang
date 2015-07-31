FROM nowk/alpine-base:3.2
MAINTAINER Yung Hwa Kwon <yung.kwon@damncarousel.com>

ENV GOLANG_MAJOR 1.4
ENV GOLANG_VERSION 1.4.2

RUN apk --update add \
    go \
    && rm -rf /var/cache/apk/* \
    && mkdir -p /go/src \
    && mkdir -p /go/bin \
    && chmod -R 777 /go

# apk go installs go at /usr/lib/go
ENV GOROOT /usr/lib/go
ENV GOPATH /go
ENV PATH $GOROOT/bin:$GOPATH/bin:$PATH

WORKDIR $GOPATH

CMD [ "/bin/sh" ]

LABEL \
    version=$GOLANG_VERSION \
    os="linux" \
    arch="amd64"
