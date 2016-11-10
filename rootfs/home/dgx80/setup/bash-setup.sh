#!/bin/sh
set -x
set -e

HOST=metal-ia.com
PC_HOST=jp.dev.$HOST
PC_NAME=pc-dev
WINDOWS_HOME=/mnt/c/Users/Razan/

link_target () {
  if [ -d $2 ];
  then
    echo "symlink already exists"
  else
    $3 ln -s $1 $2
  fi
}


# Absolute path to this script, e.g. /home/user/bin/foo.sh
SCRIPT=$(readlink -f "$0")
# Absolute path this script is in, thus /home/user/bin
SCRIPT_PATH=$(dirname "$SCRIPT")
DGX80_PATH=${SCRIPT_PATH%/setup}
ROOT_FS_PATH=${DGX80_PATH%/home/dgx80}

#add lx-tool in your user folder
link_target $DGX80_PATH /home/dgx80 sudo

#ssh
link_target $WINDOWS_HOME/.ssh ~/.ssh

#ansible Modules
sudo apt-get install software-properties-common
sudo apt-add-repository ppa:ansible/ansible
sudo apt-get update
sudo apt-get install ansible

#ANSIBLE Host
sudo cp /etc/ansible/hosts /etc/ansible/hosts.ori
echo "localhost ansible_connection=local">>temp_hosts
cat /etc/ansible/hosts.ori |tail -n +2 >>temp_hosts
sudo mv temp_hosts /etc/ansible/hosts
sudo chmod 644 /etc/ansible/hosts

#HOST
sudo cp /etc/hosts /etc/hosts.ori
echo "127.0.0.1 localhost">>temp_hosts
echo "127.0.0.1 ${PC_NAME}">>temp_hosts
echo "127.0.0.1 ${PC_HOST}">>temp_hosts
cat /etc/hosts.ori |tail -n +2 >>temp_hosts
sudo mv temp_hosts /etc/hosts
sudo chmod 644 /etc/hosts

sudo cp $ROOT_FS_PATH/etc/profile.d/envvars.sh /etc/profile.d/envvars.sh

#ansible playbook
sudo ansible-playbook /home/dgx80/setup/playbooks/1-base.yml
sudo ansible-playbook /home/dgx80/setup/playbooks/2-apache.yml --ask-sudo-pass
