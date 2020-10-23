#!/bin/bash

clear
echo "[Jonio APTResolver]"
if [ `id -u` != 0 ]; then
   echo "E: Permission Denied" 
   exit 1
fi
fileLista="/etc/apt/source.list"
echo "Insert the name of the repo which you want to add"
read NOMEREPO
echo "deb http://ppa.launchpad.net/$NOMEREPO/ppa/ubuntu focal main" >> $fileLista 
echo "deb-src http://ppa.launchpad.net/$NOMEREPO/ppa/ubuntu focal main " >> $fileLista
echo "Insert the fingerprint of the repo"
read CHIAVE
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv $CHIAVE
sudo apt update
sudo dpkg --configure -a
sudo apt --fix-broken install
