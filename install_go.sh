#!/bin/bash

sudo apt update
sudo apt upgrade -y
sudo apt install ufw build-essential jq -y

sleep 1

if [[ $(which go) && $(go version) ]]; then
    echo "Go installed!"
    # command
  else
    echo "Installing Go..."
    wget -q -O - https://raw.githubusercontent.com/canha/golang-tools-install-script/master/goinstall.sh | bash -s -- --version 1.18
fi