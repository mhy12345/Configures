ln -s $(pwd)/vimrc/.vimrc $HOME/.vimrc
ln -s $(pwd)/tmuxrc/.tmux.conf $HOME/.tmux.conf
echo '# ADD BY auto_install.sh' >> ~/.bash_profile
echo 'export PATH=$PATH:'"$(pwd)"'/scripts' >> ~/.bash_profile

tee /etc/profile.d/http_proxy.sh <<-'EOF'
export proxy="http://127.0.0.1:1087"
export http_proxy=$proxy
export https_proxy=$proxy
export ftp_proxy=$proxy
export no_proxy="localhost, 127.0.0.1, ::1"
EOF

tee /etc/profile.d/no_http_proxy.sh <<-'EOF'
unset proxy
unset http_proxy
unset https_proxy
unset ftp_proxy
unset no_proxy
EOF
