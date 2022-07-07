FROM dpe/tmux:arch

ARG USER="base"
ARG USER_UID="1000"
ARG USER_GID="$USER_UID"
ARG HOMEDIR="/home/$USER"

ENV SHELL="/usr/bin/zsh"

RUN \
	groupadd --gid $USER_GID $USER \
	&& useradd --uid $USER_UID --gid $USER_GID -m $USER \	
	&& yes | pacman -Syu \
	&& yes | pacman -S \
	sudo \
	neovim \
	which \
	zsh \
	openssh \	
	&& echo "$USER ALL=(root) NOPASSWD:ALL" > "/etc/sudoers.d/$USER" \
	&& chmod 0440 "/etc/sudoers.d/$USER" \
	&& git clone "https://github.com/ohmyzsh/ohmyzsh.git" "$HOMEDIR/.oh-my-zsh" \
	&& git clone "https://github.com/zsh-users/zsh-syntax-highlighting.git" "$HOMEDIR/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting" \
	&& mkdir -p "$HOMEDIR/.vscode-server" \
	&& chown -R $USER:$USER "$HOMEDIR/.vscode-server"

COPY "dotfiles/.tmux.conf" "$HOMEDIR/.tmux.conf"
COPY "dotfiles/.zshrc" "$HOMEDIR/.zshrc"

WORKDIR $HOMEDIR

CMD ["/usr/bin/tmux", "new-session"]
