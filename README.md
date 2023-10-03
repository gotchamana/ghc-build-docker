# Docker file for GHC build envrionment

## Build image

```bash
docker build -t ghc-build-env .
```

or

```bash
docker build -t ghc-build-env --build-arg=GHC_VERSION=9.4.7 --build-arg=CABAL_VERSION=3.6.2.0 .
```

## Run container

```bash
docker run --rm -it -v /path/to/.cabal:/home/ghc/.cabal -v /path/to/ghc/source:/home/ghc/ghc-source ghc-build-env
```

## Build GHC

If necessary, first run:

```bash
cabal update
```

```bash
cd ghc-source
./configure
hadrian/build -j --docs=none --flavour=default binary-dist-dir
```

More details check [Building GHC with Hadrian](https://gitlab.haskell.org/ghc/ghc/-/wikis/building/hadrian).
