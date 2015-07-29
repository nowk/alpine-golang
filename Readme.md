# alpine-golang

Go + Alpine for Rocket ACI conversion.

*Includes git*

Uses [nowk/alpine-base](https://github.com/nowk/alpine-base) as the Alpine base 
image.


Convert to Rocket ACI using `docker2aci`

    docker2aci docker://nowk/alpine-golang:1.4.2
    

| Stats             |         |
| ----------------- | ------- |
| Docker Image Size | ~145 MB |
| Rocket ACI Size   |  ~42 MB |

---

Or using `rkt fetch`

    rkt --insecure-skip-verify fetch docker://nowk/alpine-golang:1.4.2
    
*This maintains the size at the Docker Image size.*
