#!/bin/bash -v
sudo snap set anbox rootfs-overlay.enable=true
sudo snap restart anbox.container-manager

sudo apt install git -y
git clone https://github.com/rdv-pro/android.git
sudo cp -R ./android/system /var/snap/anbox/common/rootfs-overlay

sudo chown -R 100000:100000 /var/snap/anbox/common/rootfs-overlay
sudo chmod -R +x /var/snap/anbox/common/rootfs-overlay/system/bin
sudo chmod -R +x /var/snap/anbox/common/rootfs-overlay/system/xbin
sudo chmod -R +x /var/snap/anbox/common/rootfs-overlay/system/priv-app
sudo snap restart anbox.container-manager
