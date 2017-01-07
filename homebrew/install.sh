#!/bin/sh
#
# Homebrew
#
# This installs some of the common dependencies needed (or at least desired)
# using Homebrew.
# Ask for the administrator password upfront.
sudo -v

# Check for Homebrew
if test ! $(which brew)
then
  echo "Installing Homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Make sure we’re using the latest Homebrew.
brew update
# Upgrade any already-installed formulae.
brew upgrade
# Install homebrew packages
brew install curl --with-openssl
brew install python\
  neovim/neovim/neovim\
  htop\
  ssh-copy-id\
  aria2\
  nmap\
  packer\
  terraform\
  tig\
  youtube-dl\
  p7zip\
  wget\
  findutils\
  keybase\
  pwgen\
  go\
  tree\
  jq\
  kubernetes-cli\
  cfssl

# Install homebrew cask
brew cask install 1password
brew cask install sequel-pro
brew cask install google-chrome
brew cask install docker
brew cask install little-snitch
brew cask install spotify
brew cask install alfred
brew cask install slack
brew cask install the-unarchiver
brew cask install cleanmymac
brew cask install iterm2
brew cask install transmission
brew cask install istat-menus
brew cask install gpgtools
brew cask install spectacle
brew cask install dropbox
brew cask install vlc
brew cask install plex-media-server
brew cask install whatsapp
brew cask install irccloud
brew cask install tunnelblick
brew cask install zoomus
brew cask install macdown
brew cask install karabiner-elements
# Remove outdated versions from the cellar.
brew cleanup
exit 0
