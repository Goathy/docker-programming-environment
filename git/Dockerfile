FROM archlinux:base


RUN \
	pacman-key --init \
	&& pacman -Sy \
	&& yes | pacman -S archlinux-keyring \
	&& yes | pacman -Syu \
	&& yes | pacman -S \
	git

