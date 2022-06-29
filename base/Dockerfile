FROM tmux:bionic

COPY "configure" "/tmp/configure"
COPY "dotfiles" "/tmp/dotfiles"

RUN \
        /bin/bash /tmp/configure \
        && rm /tmp/configure

ENV SHELL="/usr/bin/zsh"
ENV LANG="C.UTF-8"

CMD ["/usr/local/bin/tmux", "new-session"]
