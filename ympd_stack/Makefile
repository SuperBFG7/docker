.PHONY: mpd ympd
SERVICES = mpd ympd

all: $(SERVICES)

$(SERVICES):
	$(MAKE) -C $@ all

start:
	sudo docker-compose up -d

stop:
	sudo docker-compose down

