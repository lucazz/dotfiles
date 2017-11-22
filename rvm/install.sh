#!/bin/bash

RUBY_VERSION="2.4.1"

if [ ! -f "$HOME/.ruby_version" ]
then
	rm -rf $HOME/.ruby-version
fi
echo "$RUBY_VERSION" > $HOME/.ruby-version


gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
\curl -sSL https://get.rvm.io | bash -s stable
source ~/.profile

if test $(which rvm)
then
	rvm requirements
	rvm install ruby-$RUBY_VERSION
	rvm	use ruby-$RUBY_VERSION
	rvm rubygems current
fi

if test $(which gem)
then
	gem install bundler
fi
