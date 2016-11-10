# first disable root access
sudo passwd -l root


#!/bin/bash
apt-get update
apt-get upgrade
apt-get install apache2 php5 php5-cli php5-curl php5-intl php5-gd php5-ldap php5-mysql php-pear php5-xdebug php5-dev php5-mcrypt curl git subversion shutter libgoo-canvas-perl gnome-web-photo vim clamav-daemon portmap nfs-common libpam-mount openssh-client openssh-server

#DBeaver (MySQL client)
#URL='http://dbeaver.jkiss.org/files/dbeaver-ce_latest_amd64.deb'; FILE=`mktemp`; wget "$URL" -qO $FILE && sudo dpkg -#i $FILE; rm $FILE

# Composer
curl -sS https://getcomposer.org/installer | php
mv composer.phar /usr/local/bin/composer

# PhpStorm
#firefox -url https://confluence.jetbrains.com/display/PhpStorm/Previous+PhpStorm+Releases &


# Xdebug (ajouter )
sudo pecl install xdebug

# Installer code sniffer
#composer global require squizlabs/php_codesniffer

#Installer mess detector
#composer global require phpmd/phpmd

# Puis mettre à jour dans phpstorm: (remplacer C:/Users/{user}/AppData/Roaming/Composer/vendor/bin/phpcs.bat par phpcs)

# Chrome
#firefox -url https://www.google.ca/chrome/browser/desktop/index.html &

#Navicat
#firefox -url http://www.navicat.com/download/navicat-for-mysql &


# préparer le setup des progets
# créer /home/www/data donner les droits à l'utilisateur
