FROM superbfg7/archlinux-minimal

RUN pacmaster.sh -Syu libmpdclient git && \
		git clone https://github.com/SuperBFG7/ympd.git && \
		mkdir ympd/build && \
		pacmaster.sh -R git perl-error 

WORKDIR ympd/build

RUN pacmaster.sh -Syu cmake gcc make pkg-config && \
		cmake .. && \
		make && \
		make install && \
		pacmaster.sh -R binutils gc guile jsoncpp libatomic_ops libmpc libtool libuv \
						libxml2 shared-mime-info cmake gcc make pkg-config

EXPOSE 8080

CMD ["/usr/local/bin/ympd", "-h", "mpd", "-u", "nobody", "-d", "/run/secrets/htdigest"]

