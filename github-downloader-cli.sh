#!/bin/bash
# Usarral
#2/11/2020
# Based on uGeek/script
if [ -z "$1" ]
  then
    echo "Introduce the username and the repository with the format user/repository"
    echo "Example: usarral/github-downloader"
    read $1
fi
if [ -z "$2" ]
  then
    echo "Introduce the format"
    echo "Alert: If there's more than one file with the same extension, the script won't work"
    read $2
fi
curl -s https://api.github.com/repos/$1/releases/latest \
| grep "browser_download_url.*$2" \
| cut -d : -f 2,3 \
| tr -d \" \
| wget -qi -
