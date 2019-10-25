mkdir ~/.tarsnap/
mkdir ~/.tarsnap/logs
mkdir ~/.tarsnap/cache
touch ~/.tarsnap/tarsnap.key
ln -s ${BASEDIR}/tarsnap/tarsnaprc ~/.tarsnaprc
ln -s ${BASEDIR}/tarsnap/tarsnap.plist ~/Library/LaunchAgents.plist
