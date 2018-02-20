#!/bin/bash

#sudo apt-get update
yum clean expire-cache
yum check-update
sudo rm /boot/grub/menu.lst

#sudo apt-get upgrade -y
#sudo apt-get install -y software-properties-common git python-dev htop ntp jq apt-transport-https
sudo yum install epel-release -y
sudo yum install git python-devel htop ntp jq -y

# Disable daily apt unattended updates.
#echo 'APT::Periodic::Enable "0";' >> /etc/apt/apt.conf.d/10periodic

wget https://bootstrap.pypa.io/get-pip.py
python get-pip.py
#pip install boto awscli
