
#!/bin/sh
set -e

echo "============================================"
echo "first argument [std, xdebug or xdebug-auto]:"
echo "============================================"
echo ""

ARG=$1
echo "type: "$ARG

sudo service apache2 stop

if [ "$ARG" = "std" ];then
    echo " * disable xdebug..."
    sudo php5dismod xdebug
else
  echo " * enable xdebug..."
    sudo php5enmod xdebug
fi

sudo service apache2 start

if [ "$ARG" = "xdebug-auto" ];then
    echo " * enable remote debug..."
    export XDEBUG_CONFIG="remote_enable=1"
    export XDEBUG_CONFIG="remote_autostart=1"

else
    export XDEBUG_CONFIG="remote_enable=0"
    export XDEBUG_CONFIG="remote_autostart=0"
    echo " * disable remote debug..."
fi
