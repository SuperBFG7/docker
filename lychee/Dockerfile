FROM greyltc/archlinux

ADD *.sh /
COPY *.xz /

RUN pacman -Syu --noconfirm php php-fpm php-gd nginx \
		mariadb git expect imagemagick && \
		pacman -U --noconfirm /php-imagick-3.4.2-1-x86_64.pkg.tar.xz && \
		git clone https://github.com/electerious/Lychee.git /srv/http && \
		chmod -R 777 /srv/http/data /srv/http/uploads && \
		pacman -R --noconfirm git

# add config file
COPY nginx.conf /etc/nginx/nginx.conf

VOLUME /fotos
EXPOSE 80

CMD ["/lychee.sh"]
