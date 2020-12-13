#!/bin/bash

TMP_FOLDER=/tmp/patch-vmware
rm -fdr $TMP_FOLDER
mkdir -p $TMP_FOLDER
cd $TMP_FOLDER
https://github.com/elppans/vmware/raw/main/vmware-host-modules-12.5.9.tar.gz
tar -zxf vmware-host-modules-12.5.9.tar.gz
cd vmware-host-modules-12.5.9
make
sudo make install
sudo rm /usr/lib/vmware/lib/libz.so.1/libz.so.1
sudo ln -s /lib/x86_64-linux-gnu/libz.so.1 /usr/lib/vmware/lib/libz.so.1/libz.so.1
sudo systemctl restart vmware && vmware &
