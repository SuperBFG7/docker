FROM superbfg7/archlinux-minimal

RUN pacmaster.sh -Syu --noconfirm python3 && \
		curl -o MPD_sima-0.14.3.tar.xz http://media.kaliko.me/src/sima/releases/MPD_sima-0.14.3.tar.xz && \
		tar xJfv MPD_sima-0.14.3.tar.xz && \
		rm MPD_sima-0.14.3.tar.xz

WORKDIR MPD_sima-0.14.3

RUN python3 ./vinstall.py

VOLUME ["/sima"]

CMD ["/MPD_sima-0.14.3/vmpd-sima", "-S", "mpd", "--var-dir", "/sima/"]

