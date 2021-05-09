apt install -y trojan
cp /usr/share/doc/trojan/examples/client.json-example /etc/trojan/config.json 
apt install -y privoxy

tee -a /etc/privoxy/config <<-'EOF'
forward-socks5 / 127.0.0.1:1080 .
listen-address 127.0.0.1:1087
EOF


tee /etc/profile.d/http_proxy.sh <<-'EOF'
export proxy="http://127.0.0.1:1087"
export http_proxy=$proxy
export https_proxy=$proxy
export ftp_proxy=$proxy
export no_proxy="localhost, 127.0.0.1, ::1"
EOF

systemctl restart privoxy

#trojan
