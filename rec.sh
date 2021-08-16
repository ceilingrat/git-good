#!/bin/bash

echo $1

if [ ! $(command -v asciinema) ]
then

  upm install -F

  mkdir $HOME/.config/asciinema
  cp $HOME/.bashrc $HOME/.config/asciinema
  echo -e '\nPS1="> "' >> $HOME/.config/asciinema/.bashrc

  echo -e "[record]\ncommand = /bin/bash --rcfile $HOME/.config/asciinema/.bashrc" > $HOME/.config/asciinema/config
fi

export ASCIINEMA_CONFIG_HOME=$HOME/.config/asciinema

filename=${1}_$(TZ="/usr/share/zoneinfo/Japan" date '+%Y%m%d_%H%M%S').cast
echo "filename is $filename"
asciinema rec -i 2 asciicast/$filename