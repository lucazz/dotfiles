#!/bin/bash
while true;
  do
    sudo -n true;
    sleep 60;
    kill -0 "$$" || exit;
  done 2>/dev/null &

ln -s ~/.dotfiles/ubersicht/zenbar ~/Library/Application\ Support/Übersicht/widgets/zenbar
