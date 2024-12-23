#!/bin/bash

# Get the directory of the script
DIR_PATH=$(dirname "$(realpath "$0")")

# Create symbolic links
ln -fs "$DIR_PATH/.zshrc" "$HOME/.zshrc"
ln -fs "$DIR_PATH/.tmux.conf" "$HOME/.tmux.conf"
ln -fs "$DIR_PATH/nvim" "$HOME/.config/nvim"
ln -fs "$DIR_PATH/zsh_fx" "$HOME/zsh_fx"

