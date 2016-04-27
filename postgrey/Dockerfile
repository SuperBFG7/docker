FROM greyltc/archlinux

RUN pacman -Syu --noconfirm postgrey && /bin/yes | pacman -Scc

EXPOSE 10030

CMD ["/usr/bin/postgrey", "--inet=0.0.0.0:10030", "--pidfile=/run/postgrey/postgrey.pid", "--group=postgrey", "--user=postgrey", "--greylist-text='Greylisted for %s seconds'"]

