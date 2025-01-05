# dot-files 

### nvim-lua
- nvim lua config files and setup

### zshrc
- zshrc file

### tmux
- tmux config file
- need to instlal TPM and cappuchin colour theme

### neovim:
```bash
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
sudo rm -rf /opt/nvim
sudo tar -C /opt -xzf nvim-linux64.tar.gz
# in zshrc
export PATH="$PATH:/opt/nvim-linux64/bin"
# install conform formatters
python3 -m pip install sqlparse
npm install -g prettier
sudo apt install shfmt
python3 -m pip install black
```

### batcat config:
```bash
mkdir -p "$(batcat --config-dir)/themes"
wget -P "$(batcat --config-dir)/themes" https://github.com/catppuccin/bat/raw/main/themes/Catppuccin%20Mocha.tmTheme
batcat cache --build
batcat --list-themes | grep -i catppuccin 
```

### fzf install:
```bash
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
```

### ripgrep install:

```bash
curl -LO https://github.com/BurntSushi/ripgrep/releases/download/14.1.0/ripgrep_14.1.0-1_amd64.deb
sudo dpkg -i ripgrep_14.1.0-1_amd64.deb
```

### tmux install:
```bash
sudo apt install tmux
# for tpm install of plugins
Press prefix + I (capital i, as in Install) to fetch the plugin
```

### gnome terminal catppuccin theme:
```bash
curl -L https://raw.githubusercontent.com/catppuccin/gnome-terminal/v1.0.0/install.py | python3 -
# then select profile in settings and add the `tmux` command in custom shell
```

### nerd font:
```bash
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/Hack.zip
unzip Hack.zip -d ~/.local/share/fonts
fc-cache -fv
fc-list | grep "Hack Nerd Font"
```

### miniconda install:
```bash
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
bash Miniconda3-latest-Linux-x86_64.sh
rm Miniconda3-latest-Linux-x86_64.sh
~/miniconda3/bin/conda init
conda update -n base -c defaults conda
```

### git-credentials-manager install:
```bash
wget https://github.com/git-ecosystem/git-credential-manager/releases/download/v{VERSION}/gcm-linux_amd64.{VERSION}.tar.gz
tar -xvzf gcm-linux_amd64.{VERSION}.tar.gz
sudo mkdir -p /usr/local/git-credential-manager
sudo mv git-credential-manager libHarfBuzzSharp.so libSkiaSharp.so /usr/local/git-credential-manager
sudo ln -s /usr/local/git-credential-manager/git-credential-manager /usr/local/bin/git-credential-manager
git config --global credential.helper "/usr/local/bin/git-credential-manager"
git-credential-manager --version
rm -rf gcm-linux_amd64.{VERSION}.tar.gz
git config --global credential.credentialStore cache 
git config --global credential.credentialStore
```

### postman install:
```bash
# download the tar file from website
tar -xvzf Postman-linux-x64.tar.gz
sudo mv Postman /opt/
sudo ln -s /opt/postman-linux-x64/Postman/Postman /usr/local/bin/postman
vi ~/.local/share/applications/postman.desktop

# create this file with content:
[Desktop Entry]
Version=1.0
Name=Postman
Comment=Postman API Client
Exec=/opt/postman-linux-x64/Postman/Postman %U
Icon=/opt/postman-linux-x64/Postman/app/resources/app/assets/icon.png
Terminal=false
Type=Application
Categories=Development;

# then change file permissions
chmod +x ~/.local/share/applications/postman.desktop
```
