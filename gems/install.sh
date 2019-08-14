#!/bin/bash
while true;
  do
    sudo -n true;
    sleep 60;
    kill -0 "$$" || exit;
  done 2>/dev/null &

gem install \
  --quiet \
    rubocop \
    bundler \
    rufo \
    standard\
    reek
