#!/bin/bash
# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &
sudo easy_install pip
sudo pip install \
  pycparser\
  cffi\
  six\
  pyasn1\
  idna\
  enum34\
  ipaddress\
  cryptography\
  paramiko\
  MarkupSafe\
  jinja2\
  PyYAML\
  pycrypto\
  ansible\
  rsa\
  python-dateutil\
  docutils\
  jmespath\
  botocore\
  colorama\
  futures\
  s3transfer\
  awscli\
  boto3\
  requests\
  backports.ssl-match-hostname\
  websocket-client\
  docker-pycreds\
  docker-py\
  boto
