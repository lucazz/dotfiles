#!/bin/bash
while true;
  do
    sudo -n true;
    sleep 60;
    kill -0 "$$" || exit;
  done 2>/dev/null &

ln -s ~/.dotfiles/yabai/yabairc ~/.yabairc
sudo yabai --install-sa
brew services start yabai
killall Dock
