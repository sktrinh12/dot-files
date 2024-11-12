#!/bin/bash

if [ "$#" -gt 0 ]; then
  # If an argument is passed, use it as the body of text
  text="$*"
else
  # Otherwise, use the output of the `fortune` command
  text=$(/usr/games/fortune)
fi

# make into list and randomly pick one
cowselect="$(/usr/games/cowsay -l | sed "1 d" | tr ' ' '\n' | /usr/bin/shuf -n 1)"
echo ${text} | /usr/games/cowsay -f "$cowselect" -W 10 | /usr/games/lolcat
