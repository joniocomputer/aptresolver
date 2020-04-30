#!/bin/bash

clear
echo "[Jonio APTResolver]"
if [ `id -u` != 0 ]; then
   echo "E: Permesso Negato" 
   exit 1
fi
fileLista="/etc/apt/source.list"
echo "Inserisci nome della repository da aggiungere"
read NOMEREPO
echo "deb http://ppa.launchpad.net/$NOMEREPO/ppa/ubuntu buster main" >> $fileLista
#Inserisce riga alla source list
echo "deb-src http://ppa.launchpad.net/$NOMEREPO/ppa/ubuntu buster main " >> $fileLista #Inserisce riga alla source list
echo "Inserisci il fingerprint della repository"
read CHIAVE
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv $CHIAVE
sudo apt update
sudo dpkg --configure -a
sudo apt --fix-broken install
