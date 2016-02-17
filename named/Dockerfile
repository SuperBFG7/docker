FROM greyltc/archlinux

RUN pacman -Sy --noconfirm systemd bind && pacman -Scc --noconfirm && \
		pacman -Rns --noconfirm systemd

VOLUME /var/named
EXPOSE 53 53/udp 953

CMD ["/usr/sbin/named", "-f", "-u", "named"]

