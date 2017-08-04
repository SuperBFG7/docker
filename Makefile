.PHONY: archlinux-minimal letsencrypt named postgrey
BASE = archlinux-minimal
RESTART_MODULES = named postgrey $(STACKS)
MODULES = letsencrypt $(RESTART_MODULES)
STACKS = ympd_stack
PUSH_MODULES = $(BASE) $(MODULES)

DOCKER_USER = superbfg7

all: $(MODULES)

restart:
	for i in $(RESTART_MODULES); do \
		$(MAKE) -C $$i create restart cleanup; \
	done 

$(BASE):
	$(MAKE) -C $@ clean all

$(MODULES): $(BASE)
	$(MAKE) -C $@

push:
	sudo docker login -u $(DOCKER_USER)
	for i in $(PUSH_MODULES); do \
		echo "----- pushing $$i"; \
		sudo docker push $(DOCKER_USER)/$$i; \
	done
