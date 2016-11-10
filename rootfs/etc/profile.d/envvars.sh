#!/bin/sh

LX_TOOLS=/home/bash-on-windows/rootfs/home/dgx80/lx-tools
export PHP_IDE_CONFIG="serverName=PRODEVJEABOU"
export PATH=$PATH:/home/scripts:$LX_TOOLS
alias php-ini=$LX_TOOLS'/php-ini.sh'
alias services-init=$LX_TOOLS'/services-init.sh'
