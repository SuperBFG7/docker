all: archlinux-minimal.tar.gz

archlinux.base:
	docker pull greyltc/archlinux
	docker build --no-cache -t superbfg7/archlinux .
	touch archlinux.base

archlinux-minimal.tar.gz: archlinux.base
	docker run --name=archlinux-base superbfg7/archlinux
	docker export archlinux-base > archlinux-minimal.tar
	docker import archlinux-minimal.tar superbfg7/archlinux-minimal
	docker tag superbfg7/archlinux-minimal superbfg7/archlinux-minimal:`date +%F`
	gzip archlinux-minimal.tar

clean:
	rm -f archlinux-minimal.tar.gz
	rm -f archlinux.base
	docker rm archlinux-base

proper: clean
	docker rmi superbfg7/archlinux
	rm -f archlinux
