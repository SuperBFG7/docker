all: letsencrypt

letsencrypt: build tag create

force: force-build tag create

build:
	docker build -t superbfg7/letsencrypt .

force-build:
	docker build -t superbfg7/letsencrypt --no-cache .

tag:
	docker tag superbfg7/letsencrypt superbfg7/letsencrypt:`/usr/bin/pacman -Sp --print-format %v letsencrypt`

create:
	docker rm letsencrypt
	docker create --name=letsencrypt -v /etc/localtime:/etc/localtime:ro \
						 			 -v /etc/letsencrypt/:/etc/letsencrypt/ \
									 -v /var/log/letsencrypt/:/var/log/letsencrypt/ \
									 -v /home/daniel/www/:/srv/http/ \
									 superbfg7/letsencrypt

clean:
	docker rm letsencrypt

proper: clean
	docker rmi superbfg7/letsencrypt

run:
	docker start -ai letsencrypt
