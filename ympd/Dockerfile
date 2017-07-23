FROM superbfg7/archlinux-minimal

COPY ympd-git*xz /
RUN pacmaster.sh -U --noconfirm /ympd-git*xz

EXPOSE 8080

CMD ["/usr/bin/ympd", "-h", "mpd", "-u", "nobody"]

