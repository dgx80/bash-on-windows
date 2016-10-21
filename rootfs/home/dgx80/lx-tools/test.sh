#!/bin/sh
# Absolute path to this script, e.g. /home/user/bin/foo.sh
SCRIPT=$(readlink -f "$0")
# Absolute path this script is in, thus /home/user/bin
SCRIPT_PATH=$(dirname "$SCRIPT")
DGX80_PATH=${SCRIPT_PATH%/lx-tools}
ROOT_FS_PATH=${DGX80_PATH%/home/dgx80}

#add lx-tool in your user folder
ln -s $DGX80_PATH ~/dgx80
