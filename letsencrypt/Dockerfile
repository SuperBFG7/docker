FROM greyltc/archlinux

RUN pacman -Syu --noconfirm certbot && /bin/yes | pacman -Scc

#ADD letsencrypt.sh /usr/local/bin

VOLUME /etc/letsencrypt
VOLUME /var/log/letsencrypt
VOLUME /srv/httpd

#CMD ["/usr/local/bin/letsencrypt.sh"]
#CMD ["/bin/bash"]
CMD ["/usr/bin/certbot", "renew"]
