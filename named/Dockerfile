FROM superbfg7/archlinux-minimal

RUN pacmaster.sh -Syu --noconfirm --overwrite "*" bind && /bin/yes | pacman -Scc

USER named

ADD --chown=named:named tmp/named/ /var/named
ADD --chown=named:named tmp/named.conf /etc/named.conf
#ADD --chown=named:named tmp/named.conf.pacnew /etc/named.conf
ADD --chown=named:named tmp/rndc.key /etc/rndc.key

VOLUME /var/named
EXPOSE 53 53/udp 953

#CMD ["/usr/sbin/named", "-f", "-u", "named", "-L", "/var/log/named"]
CMD ["/usr/sbin/named", "-g", "-u", "named"]

