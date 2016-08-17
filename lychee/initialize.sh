#!/bin/bash

echo "
extension=exif.so
extension=gd.so
extension=mysqli.so
max_execution_time = 600
post_max_size = 100M
upload_max_size = 1000M
upload_max_filesize = 20M
memory_limit = 256M" >> /etc/php/php.ini

mysql_install_db --user=mysql --basedir=/usr --datadir=/var/lib/mysql

mv -n /srv/http/uploads /srv/http/data /fotos/
rm -rf /srv/http/uploads /srv/http/data
ln -s /fotos/data /srv/http/data
ln -s /fotos/uploads /srv/http/uploads

echo > /initialize.sh
