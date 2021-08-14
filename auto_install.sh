ln -s $(pwd)/vimrc/.vimrc $HOME/.vimrc
ln -s $(pwd)/tmuxrc/.tmux.conf $HOME/.tmux.conf
echo '# ADD BY auto_install.sh' >> ~/.bash_profile
echo 'export PATH=$PATH:'"$(pwd)"'/scripts' >> ~/.bash_profile
