#!/usr/bin/env bash
HOSTNAME="bb-8"

sudo -v
while true;
	do
		sudo -n true;
		sleep 60;
		kill -0 "$$" || exit;
	done 2>/dev/null &

sudo scutil --set ComputerName $HOSTNAME
sudo scutil --set HostName $HOSTNAME
sudo scutil --set LocalHostName $HOSTNAME
sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string $HOSTNAME
sudo defaults write NSGlobalDomain InitialKeyRepeat -int 1
sudo defaults write NSGlobalDomain KeyRepeat -int 100
sudo defaults write com.apple.Dock appswitcher-all-displays -bool true
