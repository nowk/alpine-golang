# alpine-golang

Go + Alpine for Rocket ACI conversion.

*Includes git*

Uses [nowk/alpine-base](https://github.com/nowk/alpine-base) as the Alpine base 
image.

---

Convert to Rocket ACI using `docker2aci`

    docker2aci docker://nowk/alpine-golang:1.4.2

| Stats             |         |
| ----------------- | ------- |
| Docker Image Size | ~145 MB |
| Rocket ACI Size   |  ~42 MB |

---

__Note:__

Had some issues adding the ACI as a dependency to other ACIs from the 
`docker2aci` conversion alone.

    discovery failed for "nowk/alpine-golang": no endpoints discovered. Trying to find image in the store.
    aci not found

I had to change the *labels* in the `manifest` by extracting, modifying and 
rebuilding the ACI.

Original *labels* from `docker2aci` conversions all seem to look like this:

    "labels": [
      {
        "name": "version",
        "value": "latest"
      },
      {
        "name": "os",
        "value": "linux"
      }
    ]

Altering the labels to match the actual *version* and including an *arch* label 
seems necessary.

    "labels": [
      {
        "name": "version",
        "value": "1.4.2"
      },
      {
        "name": "os",
        "value": "linux"
      },
      {
        "name": "arch",
        "value": "amd64"
      }
    ]

*These labels would need to match (be included) in the dependency definition.*

*This might be a fault of my own. Still working my way through Rocket.*
