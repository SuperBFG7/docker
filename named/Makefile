all: named

named:
	docker build -t superbfg7/named .
	docker tag -f superbfg7/named superbfg7/named:`/usr/bin/pacman -Sp --print-format %v bind`
	docker create --name=named -v /etc/localtime:/etc/localtime:ro \
						 		-v /etc/named.conf:/etc/named.conf:ro \
								-v /etc/rndc.key:/etc/rndc.key:ro \
								-v /var/log/named.log:/var/log/named.log \
								-v /var/named/:/var/named \
								-v /var/run/named/:/var/run/named/ \
								-p 53:53/udp -p 53:53/tcp \
								-p 127.0.0.1:953:953 \
								superbfg7/named

clean:
	docker rm named
	docker rmi superbfg7/named

install:
	sudo cp -i named.service /etc/systemd/system/
	sudo cp -i named_IPv6.sh /usr/local/bin/
	@echo systemctl enable named
	@echo systemctl start named

