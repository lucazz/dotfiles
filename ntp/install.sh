#!/bin/bash
# Ask for the administrator password upfront.
sudo -v
# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &
sudo echo "server a.ntp.br" > /etc/ntp.conf
sudo echo "server b.ntp.br" >> /etc/ntp.conf
sudo echo "server c.ntp.br" >> /etc/ntp.conf
sudo echo "server gps.ntp.br" >> /etc/ntp.conf
sudo echo "server a.st1.ntp.br" >> /etc/ntp.conf
sudo echo "server b.st1.ntp.br" >> /etc/ntp.conf
sudo echo "server c.st1.ntp.br" >> /etc/ntp.conf
sudo echo "server d.st1.ntp.br" >> /etc/ntp.conf

sudo echo "disable monitor" >> /etc/ntp-restrict.conf

sudo killall ntpd
