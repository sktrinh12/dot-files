echo "cloning dot files from repo ..."
git clone --bare https://www.github.com/sktrinh12/dot_files.git $HOME/.dotfiles.git
/usr/local/bin/git checkout
echo "renaming cpzshrc file ... "
mv $HOME/.cpzshrc $HOME/.zshrc
