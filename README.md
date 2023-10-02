# Docker file for GHC build envrionment

## Build image

`docker build -t ghc-build-env .`

or

```bash
docker build \
    -t ghc-build-env \
    --build-arg=GHC_VERSION=9.4.7 \
    --build-arg=CABAL_VERSION=3.6.2.0 \
    .
```

## Run container

```bash
docker run \
    --rm \
    -it \
    -v /path/to/.cabal:/home/ghc/.cabal \
    -v /path/to/ghc/source:/home/ghc/ghc-source \
    ghc-build-env
```
