all: ympd

ympd: build tag

force: force-build tag

build: htdigest
	sudo docker build -t superbfg7/ympd .

force-build:
	sudo docker build -t superbfg7/ympd --no-cache .

tag:
	sudo docker tag superbfg7/ympd superbfg7/ympd:`date +%F`

htdigest:
	echo "creating htdigest for user ympd"
	# htdigest -c file realm user
	# user can be changed
	htdigest -c htdigest ympd ympd
