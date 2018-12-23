#!/bin/bash -v

#adb install ./com.bigsing.changer_v23_25075d.apk
#adb install ./XposedInstaller_3.1.5-Magisk.apk

snap set anbox rootfs-overlay.enable=true
snap restart anbox.container-manager

apt install git -y
git clone https://github.com/rdv-pro/android.git
cp -R ./android/system /var/snap/anbox/common/rootfs-overlay
wget https://dl-xda.xposed.info/modules/com.bigsing.changer_v23_25075d.apk
cp ./com.bigsing.changer_v23_25075d.apk /var/snap/anbox/common/rootfs-overlay/system/priv-app/com.bigsing.changer_v23_25075d.apk
sudo chown -R 100000:100000 /var/snap/anbox/common/rootfs-overlay
sudo chmod -R +x /var/snap/anbox/common/rootfs-overlay/system/bin
sudo chmod -R +x /var/snap/anbox/common/rootfs-overlay/system/xbin
sudo chmod -R +x /var/snap/anbox/common/rootfs-overlay/system/priv-app
snap restart anbox.container-manager
