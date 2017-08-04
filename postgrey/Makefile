all: postgrey

postgrey: build tag

force: force-build tag

build:
	docker build -t superbfg7/postgrey .

force-build:
	docker build -t superbfg7/postgrey --no-cache .

tag:
	docker tag superbfg7/postgrey superbfg7/postgrey:`/usr/bin/pacman -Sp --print-format %v postgrey | tail -1`

create:
	docker rename postgrey postgrey_old
	docker create --name=postgrey -v /etc/localtime:/etc/localtime:ro \
								-p 127.0.0.1:10030:10030 \
								superbfg7/postgrey

restart: create
	docker stop postgrey_old
	docker start postgrey
	docker rm postgrey_old

clean:
	docker rm postgrey
	docker rmi superbfg7/postgrey

install:
	cp -i postgrey.service /etc/systemd/system/
	@echo systemctl enable postgrey
	@echo systemctl start postgrey

