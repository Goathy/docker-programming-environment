FROM archlinux:base

ARG USER="base"
ARG USER_UID="1000"
ARG USER_GID="${USER_UID}"
ARG HOMEDIR="/home/${USER}"

ENV SHELL="/usr/bin/zsh"
ENV EDITOR="/usr/bin/nvim"


RUN \
	pacman-key --init \
	&& pacman -Sy \
	&& yes | pacman -S archlinux-keyring \
	&& yes | pacman -Syu \
	&& yes | pacman -S \
	git \
	sudo \
	neovim \
	which \
	zsh \
	openssh \
	&& groupadd --gid "${USER_GID}" "${USER}" \
	&& useradd --uid "${USER_UID}" --gid "${USER_GID}" -m "${USER}" \	
	&& echo "${USER} ALL=(root) NOPASSWD:ALL" > "/etc/sudoers.d/${USER}" \
	&& chmod 0440 "/etc/sudoers.d/${USER}" \
	&& git clone "https://github.com/ohmyzsh/ohmyzsh.git" "${HOMEDIR}/.oh-my-zsh" \
	&& git clone "https://github.com/zsh-users/zsh-syntax-highlighting.git" "${HOMEDIR}/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting" \
	&& git clone "https://github.com/zsh-users/zsh-autosuggestions" "${HOMEDIR}/.oh-my-zsh/custom/plugins/zsh-autosuggestions" \
	&& git clone "https://github.com/Goathy/dotfiles" "${HOMEDIR}/.dotfiles" \
	&& ln -s "${HOMEDIR}/.dotfiles/.zshrc" "${HOMEDIR}/.zshrc" \
	&& ln -s "${HOMEDIR}/.dotfiles/tmux/.tmux.conf" "${HOMEDIR}/.tmux.conf" \
	&& sed -i -e 's/export ZSH=\"<path>\"/export ZSH=${HOME}\/.oh-my-zsh/' "${HOMEDIR}/.zshrc" \
	&& mkdir -p "${HOMEDIR}/.vscode-server" \
	&& chown -R "${USER}":"${USER}" "${HOMEDIR}/.vscode-server"

WORKDIR $HOMEDIR

CMD ["/usr/bin/tmux", "new-session"]
