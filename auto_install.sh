ln -s $(pwd)/vimrc/.vimrc $HOME/.vimrc
echo '# ADD BY auto_install.sh' >> ~/.bash_profile
echo 'export PATH=$PATH:'"$(pwd)"'/scripts' >> ~/.bash_profile
