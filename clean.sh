#!/bin/bash
set -x
/etc/init.d/networking restart
apt-get -f install
#end
