all: lychee

lychee: build tag

force: force-build tag

build:
	docker build -t superbfg7/lychee .

force-build:
	docker build -t superbfg7/lychee --no-cache --no-cache .

tag: build
	docker tag superbfg7/lychee superbfg7/lychee:`date +%F`

create:
	docker rename lychee lychee_old
	docker create --name=lychee -v /etc/localtime:/etc/localtime:ro -v /home/daniel/lychee:/fotos -p 127.0.0.1:1706:80 superbfg7/lychee

restart:
	docker stop lychee_old
	docker start lychee

cleanup:
	docker rm lychee_old

clean:
	docker rm lychee
	docker rmi superbfg7/lychee

install:
	cp -i lychee.service /etc/systemd/system/
	@echo systemctl enable lychee
	@echo systemctl start lychee
