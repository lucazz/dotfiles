#!/bin/sh
sudo -v

# Check for Homebrew
if test ! $(which brew)
then
	echo "Installing Homebrew..."
	ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true;
	do
		sudo -n true;
		sleep 60;
		kill -0 "$$" || exit;
	done 2>/dev/null &
brew update
brew bundle install \
	--verbose\
	--file=Brewfile

brew cleanup
exit 0
