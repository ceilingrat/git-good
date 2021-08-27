#!/bin/bash

# if necessary, install xmllint
cmd="xmllint"
if [ ! $(command -v $cmd) ]
then
 install-pkg $cmd
fi

# collect URL from user
echo -e "Paste or type a podcast URL:"
read -p "> " URL

# blank lines
echo -e "\n\n"

# grab webpage from URL, extract JSON data, save to variable
queryXPath="//script[contains(@id,'shoebox-ember-data-store')]/text()"
textJSON=$( curl -L $URL | xmllint --html --xpath $queryXPath - 2> /dev/null )

# blank lines
echo -e "\n\n"

# parse JSON, extract data, format output
echo $textJSON | jq -r '.[].included | map(select(contains({type:"media/podcast-episode"}))) | map( [ .attributes.name, .attributes.assetUrl ] ) | .[] | @tsv' | awk -F $'\t' '{ printf "%s\n  %s\n\n", $1, $2 }'

# sample URL for testing
# ://podcasts.apple.com/us//reinventing-professionals/id1249718736