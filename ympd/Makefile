all: mpd

mpd: build tag

force: force-build tag

build: ympd-git*xz
	docker build -t superbfg7/mpd .

force-build:
	docker build -t superbfg7/mpd --no-cache .

tag:
	docker tag superbfg7/mpd superbfg7/mpd:`/usr/bin/pacman -Sp --print-format %v mpd`

start:
	docker-compose up -d

stop:
	docker-compose down

