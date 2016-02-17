all: named

named:
	docker build -t superbfg7/letsencrypt .
	docker tag -f superbfg7/letsencrypt superbfg7/letsencrypt:`/usr/bin/pacman -Sp --print-format %v letsencrypt`
	docker create --name=letsencrypt -v /etc/localtime:/etc/localtime:ro \
						 			 -v /etc/letsencrypt/:/etc/letsencrypt/ \
									 -v /var/log/letsencrypt/:/var/log/letsencrypt/ \
									 -v /home/daniel/www/:/srv/http/ \
									 superbfg7/letsencrypt

clean:
	docker rm letsencrypt
	docker rmi superbfg7/letsencrypt

run:
	docker start -ai letsencrypt
