#!/bin/sh
set -x

echo "============================================"
echo "first argument [std, xdebug or xdebug-auto]:"
echo "============================================"

ARG=$1

sudo service apache2 stop

if [ "$ARG" = "std" ];
then
    sudo php5dismod xdebug
else
    sudo php5enmod xdebug
fi
sudo service apache2 start
