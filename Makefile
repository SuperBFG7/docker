.PHONY: archlinux-minimal letsencrypt named postgrey
BASE = archlinux-minimal
MODULES = letsencrypt $(RESTART_MODULES) $(STACKS)
RESTART_MODULES = named postgrey
STACKS = ympd_stack
PUSH_MODULES = $(BASE) $(MODULES)

DOCKER_USER = superbfg7

all: $(MODULES)

force:
	$(MAKE) -C $(BASE) clean
	$(MAKE) all

restart:
	for i in $(RESTART_MODULES); do \
		$(MAKE) -C $$i create restart cleanup; \
	done 

$(BASE):
	$(MAKE) -C $@

$(MODULES): $(BASE)
	$(MAKE) -C $@

push:
	sudo docker login -u $(DOCKER_USER)
	for i in $(PUSH_MODULES); do \
		echo "----- pushing $$i"; \
		sudo docker push $(DOCKER_USER)/$$i; \
	done
