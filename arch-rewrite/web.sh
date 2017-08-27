#!/bin/sh

##this script is use to build a website
sudo pacman -Syu
sudo pacman -S apache
echo 'Edit /etc/httpd/conf/httpd.conf file,
Search and comment out the following line if it is not already:
[...]
# LoadModule unique_id_module modules/mod_unique_id.so
[...]
'
sudo nano /etc/httpd/conf/httpd.conf
sudo  systemctl start httpd
cd /srv/http/
vim index.html
sudo pacman -S mysql
sudo mysql_install_db --user=mysql --basedir=/usr --datadir=/var/lib/mysql
sudo systemctl start mysqld
sudo systemctl status mysqld
echo 'then ,you should to do some settings
enter+enter an new passwd+enter +enter.....'
sudo mysql_secure_installation
sudo pacman -S php php-apache
echo 'then ..............
edit /etc/httpd/conf/httpd.conf file,

sudo nano /etc/httpd/conf/httpd.conf
Find the following line and comment it out:

[...]
#LoadModule mpm_event_module modules/mod_mpm_event.so
[...]
Uncomment or add the line:

LoadModule mpm_prefork_module modules/mod_mpm_prefork.so
Then, add the following lines at the bottom:

LoadModule php7_module modules/libphp7.so
AddHandler php7-script php
Include conf/extra/php7_module.conf

Save and close the file.'
sudo echo '<?php
phpinfo' > /srv/http/test.php
sudo systemctl restart httpd

sudo pacman -S phpmyadmin php-mcrypt
sudo nano /etc/php/php.ini
echo '
Make sure the following lines are uncommented.

[...]
extension=bz2.so
extension=mcrypt.so
extension=mysqli.so
[...]
Next, create configuration file for phpMyAdmin,'

sudo nano /etc/httpd/conf/extra/phpmyadmin.conf
echo 'Add the following lines:

Alias /phpmyadmin "/usr/share/webapps/phpMyAdmin"
<Directory "/usr/share/webapps/phpMyAdmin">
DirectoryIndex index.php
AllowOverride All
Options FollowSymlinks
Require all granted
</Directory>
'
echo 'Then, open Apache configuration file,'

sudo nano /etc/httpd/conf/httpd.conf
echo 'Add the following line at the end:

Include conf/extra/phpmyadmin.conf

Save and close the file.
Restart httpd service.'
sudo systemctl restart httpd
sudo nano /etc/webapps/phpmyadmin/config.inc.php
echo '
$cfg['blowfish_secret'] = '`MyP@$S`'; /* YOU MUST FILL IN THIS FOR COOKIE AUTH!$ /**'
sudo systemctl restart httpd
