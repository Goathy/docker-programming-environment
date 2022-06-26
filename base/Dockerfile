FROM ubuntu:18.04 

ARG DEFAULT_SHELL="/usr/bin/zsh"
ARG HOME_DIR="/root"

ENV LANG="C.UTF-8"
ENV LC_ALL="C.UTF-8"
ENV SHELL="$DEFAULT_SHELL"

WORKDIR "$HOME_DIR"

COPY "configure" "/tmp/configure"

RUN \
	/bin/bash /tmp/configure \
	&& rm /tmp/configure

# Copy configuration files
COPY "dotfiles/.tmux.conf" "/root/.tmux.conf"
COPY "dotfiles/.zshrc" "/root/.zshrc"

CMD ["/usr/local/bin/tmux", "new-session"]
