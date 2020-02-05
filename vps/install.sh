ln -s $(pwd)/ss_config.json ~/
pip install shadowsocks
cd /tmp
wget https://git.io/v2ray.sh
. v2ray.sh
systemctl stop firewalld.service
