#!/bin/bash


# make into list and randomly pick one
cowfile="$(cowsay -l | sed "1 d" | tr ' ' '\n' | shuf -n 1)"
# generate text
eng_text=$(fortune)
# replace space with url encode
url_text=$(echo $eng_text | sed -e 's/\ /%20/g')
# echo $text

#use google api to translate the text, parse the translation
viet_text=$(curl -s "https://www.googleapis.com/language/translate/v2?key=$(cat $HOME/Documents/google-api)&source=en&target=vi&q=${url_text}" | jq -r '.data.translations[0].translatedText' | sed -e 's/&quot/"/g' )
	#| grep 'translatedText' | sed -r 's/^[^:]*:(.*)$/\1/' | tr -d '"')

# force CR in output; width of 50 and randomize the animal
(echo -e "English: ${eng_text}\n"; echo -e "Viet: ${viet_text}\n") \
	| cowsay -f "$cowfile" -W50 | lolcat
