.PHONY: mpd ympd sima
SERVICES = mpd ympd sima

all: $(SERVICES)

$(SERVICES):
	$(MAKE) -C $@ all

start:
	sudo docker-compose up -d

stop:
	sudo docker-compose down

