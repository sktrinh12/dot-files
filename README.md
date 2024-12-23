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

### miniconda:
```bash
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
bash Miniconda3-latest-Linux-x86_64.sh
rm Miniconda3-latest-Linux-x86_64.sh
~/miniconda3/bin/conda init
conda update -n base -c defaults conda
```
