FROM dpe/base:arch

ARG VERSION
ARG PACKAGE="go$VERSION.linux-amd64.tar.gz"

RUN \
	pacman -Syy \
	&& yes | pacman -Syu \
	&& yes | pacman -S gcc \
	&& curl -fsSLO --compressed "https://go.dev/dl/$PACKAGE" \
	&& tar -C "/usr/sbin" -xzf "$PACKAGE" \
	&& rm "$PACKAGE"

ENV PATH="$PATH:/usr/sbin/go/bin"
