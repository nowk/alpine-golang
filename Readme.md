# alpine-golang

Go + Alpine

    FROM nowk/alpine-base:3.2


| Stats             |         |
| ----------------- | ------- |
| Docker Image Size | ~247 MB |

---

`ENV` variables

    GOLANG_MAJOR   1.5
    GOLANG_VERSION 1.5
    GOROOT         /usr/lib/go
    GOPATH         /go
    PATH           $GOROOT/bin:$GOPATH/bin:$PATH
