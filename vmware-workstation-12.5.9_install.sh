#!/bin/bash

VMWARE_VERSION=workstation-12.5.9
TMP_FOLDER=/tmp/patch-vmware

sudo apt-get install dkms libncurses5 fuse2fs libcanberra-gtk3-0 hicolor-icon-theme fontconfig zlib1g build-essential linux-headers-`uname -r` libcanberra-gtk-module
wget -c https://download3.vmware.com/software/wkst/file/VMware-Workstation-Full-12.5.9-7535481.x86_64.bundle
sudo bash ./VMware-Workstation-Full-12.5.9-7535481.x86_64.bundle --eulas-agreed

rm -fdr $TMP_FOLDER
mkdir -p $TMP_FOLDER
cd $TMP_FOLDER
git clone https://github.com/mkubecek/vmware-host-modules.git
cd $TMP_FOLDER/vmware-host-modules
git checkout $VMWARE_VERSION
git fetch
make
sudo make install
sudo rm /usr/lib/vmware/lib/libz.so.1/libz.so.1
sudo ln -s /lib/x86_64-linux-gnu/libz.so.1 /usr/lib/vmware/lib/libz.so.1/libz.so.1
sudo systemctl restart vmware && vmware &
