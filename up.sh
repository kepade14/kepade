#!/bin/bash
##start with my own
echo 'this script is to update and upgrade my system'
set -x

apt-get clean
apt-get update
apt-get upgrade -y
apt-get dist-upgrade -y
apt autoremove  -y
#end      






