#!/bin/bash

#Installer build-essential
apt-get install build-essential -y

#Installer les kernel header
apt-get install linux-headers-$(uname -r) -y

#libxml2
apt-get install libxml2 -y

#libxml2-dev
apt-get install libxml2-dev -y

#libncurses5
apt-get install libncurses5 -y

apt-get install libncurses5-dev -y
apt-get install libnewt0.52 -y
apt-get install libnewt-dev -y
apt-get install vim-nox -y
apt-get install libsqlite3-dev -y

cd /usr/local/src

wget http://downloads.asterisk.org/pub/telephony/certified-asterisk/certified-asterisk-13.1-current.tar.gz

apt-get install libpri1.4 -y

wget http://downloads.asterisk.org/pub/telephony/dahdi-linux-complete/dahdi-linux-complete-2.10.2-rc1+2.10.2-rc1.tar.gz

tar -zxf dahdi-linux-complete-2.10.2-rc1+2.10.2-rc1.tar.gz
tar -zxf certified-asterisk-13.1-current.tar.gz

cd /usr/local/src/certified-asterisk-13.1-cert2/contrib/scripts
./install_prereq install

cd /usr/local/src/dahdi-linux-complete-2.10.2-rc1+2.10.2-rc1
make
make install
sleep 5
make config

cd /usr/local/src/certified-asterisk-13.1-cert2
./configure
make menuselect.makeopts
menuselect/menuselect --enable CORE-SOUNDS-FR-GSM --enable CORE-SOUNDS-FR-ULAW --enable EXTRA-SOUNDS-FR-GSM --enable EXTRA-SOUNDS-FR-ULA --enable pbx_ael --enable aelparse --enable app_meetme --enable MOH-OPSOUND-ULAW --enable chan_sip menuselect.makeopts
make install
sleep 5
make samples
make config
