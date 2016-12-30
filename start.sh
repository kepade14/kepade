#!/bin/bash
echo 'kepade service '
set -x 
service tor start
service vsftpd start
service apache2 start
service ssh start
service postgresql start
#end
