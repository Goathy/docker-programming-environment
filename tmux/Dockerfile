FROM dpe/git:arch

RUN \
	yes | pacman -Syu \
	&& yes | pacman -S \
	tmux

CMD ["/usr/bin/tmux", "new-session"]
