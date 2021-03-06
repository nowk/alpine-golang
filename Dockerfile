FROM nowk/alpine-base:3.2
MAINTAINER Yung Hwa Kwon <yung.kwon@damncarousel.com>

ENV GOLANG_MAJOR 1.5
ENV GOLANG_VERSION 1.5

RUN apk --update-cache --allow-untrusted \
	--repository http://dl-3.alpinelinux.org/alpine/edge/main/ \
	--arch=x86_64 add \
    go=${GOLANG_VERSION}-r0 \
    && rm -rf /var/cache/apk/*

RUN mkdir -p /go/src /go/bin \
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
