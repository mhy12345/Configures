#!/bin/bash
export TROJAN_HOSTNAME="ipv4.vpn2.mhy12345.xyz"
echo "TROJAN_HOSTNAME=" $TROJAN_HOSTNAME

wget --no-check-certificate https://github.com/teddysun/across/raw/master/bbr.sh && chmod +x bbr.sh && sudo ./bbr.sh

sudo bash -c "$(curl -fsSL https://raw.githubusercontent.com/trojan-gfw/trojan-quickstart/master/trojan-quickstart.sh)"
sudo letsencrypt certonly
vim /usr/local/etc/trojan/config.json 
systemctl start trojan
systemctl status trojan
