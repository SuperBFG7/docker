FROM superbfg7/archlinux-minimal

RUN pacmaster.sh -Syu --noconfirm mpd mpc

COPY mpd.conf /etc/
VOLUME ["/mpd", "/music"]
EXPOSE 6600
EXPOSE 8000

CMD ["/usr/bin/mpd", "--stdout", "--no-daemon"]

