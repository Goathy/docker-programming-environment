FROM git:bionic

COPY "configure" "/tmp/configure"

RUN \
        /bin/bash /tmp/configure \
        && rm /tmp/configure

CMD ["/bin/bash"]
