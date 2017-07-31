FROM greyltc/archlinux

COPY pacmaster.sh /usr/local/bin/
RUN	pacman -Syu --noconfirm pwgen && \
		pwgen -s -1 16 | (read i; echo "$i"; echo "$i") | passwd && \
		pacmaster.sh -R pwgen && \
		pacmaster.sh -Syu

CMD ["/usr/local/bin/pacmaster.sh","-Syu"]
