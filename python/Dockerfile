FROM dpe/base:arch

ARG VERSION
ARG PACKAGE="Python-$VERSION.tar.xz"

RUN \
    pacman -Syy \
    && yes | pacman -Su \
    && yes | pacman -S \
    gcc \
    pkgconf \
    make \
    && curl -fsSLO --compressed "https://www.python.org/ftp/python/$VERSION/$PACKAGE" \
    && mkdir "python" \
    && tar -xf "$PACKAGE" -C "python" --strip-components=1 \
    && rm "$PACKAGE" \
    && cd "python" \
    && ./configure --enable-optimizations \
    && make \
    && make install
