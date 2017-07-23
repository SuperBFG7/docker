.PHONY: archlinux

all: archlinux-minimal.tar.gz

archlinux:
	sudo docker pull greyltc/archlinux
	sudo docker build --no-cache -t superbfg7/archlinux .

archlinux-minimal.tar.gz: archlinux
	sudo docker run --name=archlinux-base superbfg7/archlinux
	sudo docker export archlinux-base > archlinux-minimal.tar
	sudo docker import archlinux-minimal.tar superbfg7/archlinux-minimal
	sudo docker tag superbfg7/archlinux-minimal superbfg7/archlinux-minimal:`date +%F`
	gzip archlinux-minimal.tar

clean:
	rm -f archlinux-minimal.tar.gz
	sudo docker rm archlinux-base

proper: clean
	sudo docker rmi superbfg7/archlinux
