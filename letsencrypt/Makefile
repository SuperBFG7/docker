TARGET=/usr/local/bin/
REPO=superbfg7
IMAGE_NAME=letsencrypt
IMAGE=$(REPO)/$(IMAGE_NAME)
CONTAINER=letsencrypt

all: $(IMAGE_NAME)

$(IMAGE_NAME): build tag create

force: force-build tag create

build:
	docker build -t $(IMAGE) .

force-build:
	docker build --no-cache -t $(IMAGE) .

tag:
	docker tag $(IMAGE) $(IMAGE):`/usr/bin/pacman -Sp --print-format %v certbot | tail -1`

create: clean
	docker create --name=$(CONTAINER) \
		-v /etc/localtime:/etc/localtime:ro \
		-v /etc/letsencrypt/:/etc/letsencrypt/ \
		-v /var/log/letsencrypt/:/var/log/letsencrypt/ \
		-v /var/lib/letsencrypt/:/var/lib/letsencrypt/ \
		$(IMAGE)

clean:
	docker rm $(CONTAINER) || /bin/true

proper: clean
	docker rmi $(IMAGE)

install:
	cp -iu *.sh $(TARGET)

uninstall:
	for i in *.sh ; do \
		rm -i "$(TARGET)"`basename $$i`; \
	done
