#!/bin/bash
while true;
  do
    sudo -n true;
    sleep 60;
    kill -0 "$$" || exit;
  done 2>/dev/null &

go get -u \
  github.com/chuckha/kubeyaml/cmd/kubeyaml \
  golang.org/x/tools/gopls

mv $GOPATH/bin/kubeyaml $GOPATH/bin/klint
