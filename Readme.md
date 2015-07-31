# alpine-golang

Go + Alpine for Rocket ACI conversion.

| Stats             |         |
| ----------------- | ------- |
| Docker Image Size | ~146 MB |
| Rocket ACI Size   | ~42 MB  |

---

`ENV` variables

    GOLANG_MAJOR   1.4
    GOLANG_VERSION 1.4.2
    GOROOT         /usr/lib/go
    GOPATH         /go
    PATH           $GOROOT/bin:$GOPATH/bin:$PATH

---

__Converting:__

    docker2aci docker://nowk/alpine-golang:1.4.2

*Latest version of the actool will properly export the LABEL directives defined 
in the Dockerfile, else please read below.*

Because the `arch` label is not exported, we will need to add that in manually 
by extracting, modifying the manifest then rebuilding the ACI before adding to
our image store.

    tar xvf nowk-alpine-golang-1.4.2.aci -C alpine-golang

Add the `arch` label.

    ...
    "labels": [
        ...
        {
            "name": "arch",
            "value": "amd64"
        },
        ...
    ],
    ...

Rebuild the ACI.

    actool build --overwrite alpine-golange alpine-golang-1.4.2-linux-amd64.aci

Add to the image store via `rkt fetch`.

    sudo rkt --insecure-skip-verify fetch alpine-golang-1.4.2-linux-amd64.aci

__Add as a dependency:__

In your app's ACI `manifest`.

    ...
    "dependencies": [
        {
            "imageName": "nowk/alpine-golang",
            "labels": [
                {
                    "name": "version",
                    "value": "1.4.2",
                },
                {
                    "name": "os",
                    "value": "linux",
                },
                {
                    "name": "arch",
                    "value": "amd64",
                }
            ]
        }
    ],
    ...

__Go binary:__

The go binary is located at:

    /usr/bin/go
