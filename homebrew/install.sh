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
brew install curl --with-openssl
brew install \
	bash\
	bash-completion\
	python\
	mas\
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
	cfssl\
	autojump\
	bash
	fzf

brew link --overwrite python

brew cask install\
	1password
	firefox\
	docker\
	little-snitch\
	spotify\
	alfred\
	slack\
	the-unarchiver\
	cleanmymac\
	iterm2\
	transmission\
	istat-menus\
	gpgtools\
	spectacle\
	dropbox\
	vlc\
	whatsapp\
	viscosity\
	zoomus\
	macdown\
	etcher

brew cleanup
exit 0
