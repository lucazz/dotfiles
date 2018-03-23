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
brew upgrade
brew install curl \
	--with-openssl
brew install reattach-to-user-namespace \
	--with-wrap-pbcopy-and-pbpaste
brew install \
	bash\
	watch\
	bash-completion\
	python\
	neovim\
	htop\
	nmap\
	packer\
	terraform\
	youtube-dl\
	p7zip\
	wget\
	findutils\
	pwgen\
	go\
	tree\
	jq\
	kubernetes-cli\
	kubernetes-helm\
	cfssl\
	autojump\
	bash\
	kubectx\
	gpg\
	gpg2\
	gnupg\
	gpg-agent\
	pinentry-mac\
	fzf

brew link --overwrite python

brew cask install 1password
brew cask install google-chrome
brew cask install docker
brew cask install little-snitch
brew cask install spotify
brew cask install alfred
brew cask install the-unarchiver
brew cask install cleanmymac
brew cask install iterm2
brew cask install transmission
brew cask install istat-menus
brew cask install gpg-suite
brew cask install spectacle
brew cask install dropbox
brew cask install vlc
brew cask install viscosity
brew cask install zoomus
brew cask install macdown
brew cask install franz

brew cleanup
exit 0
