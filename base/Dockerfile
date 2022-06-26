FROM tmux:bionic

COPY "configure" "/tmp/configure"
COPY "dotfiles" "/tmp/dotfiles"

RUN \
        /bin/bash /tmp/configure \
        && rm /tmp/configure

ENV SHELL="/usr/bin/zsh"

CMD ["/usr/local/bin/tmux", "new-session"]
