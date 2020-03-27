#!/bin/bash
export TROJAN_HOSTNAME="ipv4.vpn2.mhy12345.xyz"
echo "TROJAN_HOSTNAME=" $TROJAN_HOSTNAME

echo "install bbr [y/n/q]"
read cmd
if [ $cmd = "y" ]; then
	set -v on
	wget --no-check-certificate https://github.com/teddysun/across/raw/master/bbr.sh && chmod +x bbr.sh && ./bbr.sh
	set -v off
elif [ $cmd = "q" ]; then
	exit
fi

echo "install caddy [y/n/q]"
read cmd
if [ $cmd = "y" ]; then
	set -v on
	echo "$TROJAN_HOSTNAME {
		tls toby@$TROJAN_HOSTNAME
		log /var/log/caddy.log
	}" > /usr/local/caddy/Caddyfile
	cat /usr/local/caddy/Caddyfile
	service caddy start
	sleep 1
	tail /tmp/caddy.log
	set -v off
elif [ $cmd = "q" ]; then
	exit
fi

echo "install trojan [y/n/q]"
read cmd
if [ $cmd = "y" ]; then
	set -v on
	bash -c "$(curl -fsSL https://raw.githubusercontent.com/trojan-gfw/trojan-quickstart/master/trojan-quickstart.sh)"
	service caddy stop
	echo ":80 {
	root /var/www/site
	gzip
	browse
	}" > /usr/local/caddy/Caddyfile
	service caddy start
	ls /.caddy/acme/acme-v02.api.letsencrypt.org/sites/
	echo " EDIT:
\"cert\":\"/.caddy/acme/acme-v02.api.letsencrypt.org/sites/$TROJAN_HOSTNAME/$TROJAN_HOSTNAME.crt\",
\"key\":\"/.caddy/acme/acme-v02.api.letsencrypt.org/sites/$TROJAN_HOSTNAME/$TROJAN_HOSTNAME.key\",
\"password\":...."
	vim /usr/local/etc/trojan/config.json 
	systemctl start trojan
	systemctl status trojan
	set -v off
elif [ $cmd = "q" ]; then
	exit
fi


echo "
Now you can 
systemctl enable trojan
"
