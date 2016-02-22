FROM greyltc/archlinux

RUN pacman -Syu --noconfirm systemd bind && /bin/yes | pacman -Scc && \
		pacman -Rns --noconfirm systemd

VOLUME /var/named
EXPOSE 53 53/udp 953

CMD ["/usr/sbin/named", "-f", "-u", "named"]

