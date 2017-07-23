#!/bin/bash -e

sed -i 1i"# Ignore WLAN interfaces to allow static configuration.\ndenyinterfaces wlan*\n" /etc/dhcpcd.conf

install -m 644 files/wlan0 ${ROOTFS_DIR}/etc/network/interfaces.d/wlan0
install -m 644 files/wlan1 ${ROOTFS_DIR}/etc/network/interfaces.d/wlan1

