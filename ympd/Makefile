all: ympd

ympd: build tag

force: force-build tag

build: htdigest ympd-git*xz
	sudo docker build -t superbfg7/ympd .

force-build:
	sudo docker build -t superbfg7/ympd --no-cache .

tag:
	sudo docker tag superbfg7/ympd superbfg7/ympd:`date +%F`

start:
	sudo docker-compose up -d

stop:
	sudo docker-compose down

htdigest:
	htdigest -c htdigest ympd
