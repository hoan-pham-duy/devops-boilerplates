#! /bin/bash
apt-get -y update
apt-get -y upgrade
apt install -y wget

/bin/bash /usr/local/bin/jenkins.sh