#!/bin/bash
while true;
  do
    sudo -n true;
    sleep 60;
    kill -0 "$$" || exit;
  done 2>/dev/null &

sudo mkdir /System/Volumes/Data/opt/nix
sudo chown ${USER} /System/Volumes/Data/opt/nix
sudo sh -c "echo 'nix\tSystem/Volumes/Data/opt/nix' >> /etc/synthetic.conf"
