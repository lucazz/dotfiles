#!/bin/bash
#launchctl load ~/.dotfiles/cron/backup.plist
#launchctl unload ~/.dotfiles/cron/backup.plist
#launchctl start me.lucazz.backup
#launchctl stop me.lucazz.backup
#launchctl list

set -euf -o pipefail

rsync \
	--archive \
	--verbose \
	--compress \
	--rsh="ssh" \
	--progress \
	~/.ssh/keys/ \
	root@freenas.local:/mnt/pool0/backups/ssh/

rsync \
	--archive \
	--verbose \
	--compress \
	--rsh="ssh" \
	--progress \
	~/.gnupg/keys/main/ #\
	root@freenas.local:/mnt/pool0/backups/pgp/
