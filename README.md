# dot-files 

### nvim-lua
- nvim lua config files and setup

### zshrc
- zshrc file

### tmux
- tmux config file
- need to instlal TPM and cappuchin colour theme


### batcat config:
```bash
mkdir -p "$(batcat --config-dir)/themes"
cd "$(batcat --config-dir)/themes"
# Replace _night in the lines below with _day, _moon, or _storm if needed.
curl -O https://raw.githubusercontent.com/folke/tokyonight.nvim/main/extras/sublime/tokyonight_night.tmTheme
batcat cache --build
batcat --list-themes | grep tokyo
echo 'export BAT_THEME="tokyonight_night"' >> "$HOME/.zshrc"
```
