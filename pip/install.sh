#!/bin/bash
while true;
	do
		sudo -n true;
		sleep 60;
		kill -0 "$$" || exit;
	done 2>/dev/null &

sudo easy_install pip
sudo -H pip install -r requirements.txt
