FROM nowk/alpine-base:3.2
MAINTAINER Yung Hwa Kwon <yung.kwon@damncarousel.com>

RUN apk --update add \
  go git \
  && rm -rf /var/cache/apk/*

ENV GOLANG_VERSION 1.4.2

# apk go installs go at /usr/lib/go
ENV PATH /usr/lib/go/bin:$PATH

RUN mkdir -p /go/src /go/bin && chmod -R 777 /go

ENV GOPATH /go
ENV PATH /go/bin:$PATH

WORKDIR /go

CMD [ "/bin/bash" ]
