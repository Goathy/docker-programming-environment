FROM tmux:bionic

# Check if image is build on MacOS or Linux
# ARG PLATFORM
ARG USER="base"
# ARG UID="1000"
# ARG GID=$UID

COPY "configure" "/tmp/configure"
COPY "dotfiles" "/tmp/dotfiles"

RUN \
        /bin/bash /tmp/configure $USER \
        && rm /tmp/configure

ENV SHELL="/usr/bin/zsh"
ENV LANG="C.UTF-8"

USER $USER

CMD ["/usr/local/bin/tmux", "new-session"]
