FROM superbfg7/archlinux-minimal

RUN pacmaster.sh -Syu --noconfirm --overwrite "*" bind && /bin/yes | pacman -Scc

USER named

VOLUME /var/named
EXPOSE 53 53/udp 953

CMD ["/usr/sbin/named", "-f", "-u", "named", "-L", "/var/log/named"]
#CMD ["/usr/sbin/named", "-g", "-u", "named"]

