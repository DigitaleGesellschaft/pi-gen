#!/bin/bash -e

install -m 644 files/wlan0 ${ROOTFS_DIR}/etc/network/interfaces.d/wlan0

install -m 644 files/hostapd.conf ${ROOTFS_DIR}/etc/hostapd/hostapd.conf
sed -i 's/#DAEMON_CONF=""/DAEMON_CONF="\/etc\/hostapd\/hostapd.conf"/' ${ROOTFS_DIR}/etc/default/hostapd

