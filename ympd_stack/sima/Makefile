all: sima

sima: build tag

force: force-build tag

build:
	sudo docker build -t superbfg7/sima .

force-build:
	sudo docker build -t superbfg7/sima --no-cache .

tag:
	sudo docker tag superbfg7/sima superbfg7/sima:0.14.3

