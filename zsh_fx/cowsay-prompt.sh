#!/bin/bash

if [ "$#" -gt 0 ]; then
  # If an argument is passed, use it as the body of text
  text="$*"
else
  # Otherwise, use the output of the `fortune` command
  text=$(/usr/games/fortune)
fi

# -p “Paranoid”, uses @@ eyes
# 50 is the bubble text width
echo ${text} | /usr/games/cowsay -p -W 50 | /usr/games/lolcat
