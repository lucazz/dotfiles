#!/bin/bash

sudo apt-get remove -y \
	docker \
	docker-engine \
	docker.io \
	containerd \
	runc

sudo apt install -y \
	apt-transport-https \
	ca-certificates \
	curl \
	lsb-release \
	gnupg \
	software-properties-common

sudo apt-key
	--keyring /usr/share/keyrings/1password.gpg adv \
	--keyserver keyserver.ubuntu.com \
	--recv-keys 3FEF9748469ADBE15DA7CA80AC2D62742012EA22

curl -s https://brave-browser-apt-release.s3.brave.com/brave-core.asc | sudo apt-key --keyring /etc/apt/trusted.gpg.d/brave-browser-release.gpg add -
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key --keyring /usr/share/keyrings/cloud.google.gpg add -
curl https://zoom.us/linux/download/pubkey | sudo apt-key --keyring /usr/share/keyrings/zoom.gpg add -

echo 'deb [arch=amd64 signed-by=/usr/share/keyrings/1password.gpg] https://downloads.1password.com/linux/debian edge main' | sudo tee /etc/apt/sources.list.d/1password.list > /dev/null
echo "deb [arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser.list > /dev/null
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list > /dev/null

sudo add-apt-repository \
	ppa:aslatter/ppa

sudo apt update

sudo apt install -y \
	1password \
	alacritty \
	autojump \
	bat \
	brave-browser \
	direnv \
	docker-ce \
	docker-ce-cli \
	docker-ce-rootless-extras \
	fzf \
	geary \
	git \
	git-man \
	google-cloud-sdk \
	gpg \
	gpg-agent \
	kubectl \
	kubectx \
	kubens \
	slack \
	neovim \
	spotify-client \
	tmux \
	unzip \
	wget \
	zoom
