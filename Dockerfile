FROM l3iggs/archlinux:latest

ARG UID
ARG GID

RUN pacman -Sy --noconfirm bind && pacman -Scc --noconfirm && \
		groupadd -g $GID named && \
		useradd -r -u $UID -g $GID -s /usr/bin/nologin named

VOLUME /var/named
EXPOSE 53 53/udp 953

CMD ["/usr/sbin/named", "-f", "-u", "named"]

