#!/bin/bash

# make into list and randomly pick one
cowselect="$(cowsay -l | sed "1 d" | tr ' ' '\n' | shuf -n 1)"
eng_text=$(fortune)
echo ${eng_text} | cowsay -f "$cowselect" -W50 | lolcat
