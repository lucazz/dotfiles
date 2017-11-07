#!/bin/bash
while true;
	do
		sudo -n true;
		sleep 60;
		kill -0 "$$" || exit;
	done 2>/dev/null &

sudo easy_install pip
sudo pip install\
	ansible==2.2.1.0\
	boto\
	boto3\
	botocore\
	awscli\
	s3transfer\
	futures\
	jmespath\
	colorama\
	docker-py\
	docker-pycreds\
	pep8\
	requests\
	pylint\
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
	rsa\
	python-dateutil\
	docutils\
	backports.ssl-match-hostname\
	websocket-client
