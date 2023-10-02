FROM fedora:33

RUN dnf -y install \
    glibc-devel \
    ncurses-devel \
    gmp-devel \
    elfutils-devel \
    autoconf \
    automake \
    libtool \
    gcc \
    gcc-c++ \
    make \
    perl \
    python \
    happy \
    alex \
    git \
    curl \
    diffutils && \
    dnf clean all

RUN useradd --create-home --shell /bin/bash ghc

RUN curl -fsSL https://downloads.haskell.org/~ghcup/x86_64-linux-ghcup -o /usr/bin/ghcup && \
    chmod a+x /usr/bin/ghcup

ARG GHC_VERSION=9.4.7

ARG CABAL_VERSION=3.6.2.0

RUN ghcup install ghc $GHC_VERSION --force --isolate /usr/local && \
    ghcup install cabal $CABAL_VERSION --force --isolate /usr/local/bin

WORKDIR /home/ghc

USER ghc

ENTRYPOINT ["/bin/bash"]
