#!/bin/bash

DIR_PATH=$(dirname "$0")

ln -s "$DIR_PATH/zshrc $HOME/.zshrc"
ln -s "$DIR_PATH/.tmux.conf $HOME/.tmux.conf"
ln -s "$DIR_PATH/nvim $HOME/.config/nvim"
ln -s "$DIR_PATH/zsh_fx $HOME/zsh_fx"
