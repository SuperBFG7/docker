FROM greyltc/archlinux

RUN pacman -Sy --noconfirm letsencrypt && pacman -Scc --noconfirm

#ADD letsencrypt.sh /usr/local/bin

VOLUME /etc/letsencrypt
VOLUME /var/log/letsencrypt
VOLUME /srv/httpd

#CMD ["/usr/local/bin/letsencrypt.sh"]
#CMD ["/bin/bash"]
CMD ["/usr/bin/letsencrypt", "renew"]
