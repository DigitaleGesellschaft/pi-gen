#!/bin/bash -e

install -m 644 files/wlan0 ${ROOTFS_DIR}/etc/network/interfaces.d/wlan0

install -m 644 files/hostapd.conf ${ROOTFS_DIR}/etc/hostapd/hostapd.conf
sed -i 's/#DAEMON_CONF=""/DAEMON_CONF="\/etc\/hostapd\/hostapd.conf"/' ${ROOTFS_DIR}/etc/default/hostapd

# Prevent wpa_supplicant from grabbing our wlan0 interface
echo "disabled=1" >> ${ROOTFS_DIR}/etc/wpa_supplicant/wpa_supplicant.conf

# Install traffic forwarding rules for iptables
install -m 644 files/30-ipforward.conf ${ROOTFS_DIR}/etc/sysctl.d/30-ipforward.conf
install -m 644 files/iptables.up.rules ${ROOTFS_DIR}/etc/iptables.up.rules
install -m 755 files/iptables ${ROOTFS_DIR}/etc/network/if-pre-up.d/iptables

# Configure DHCP server
sed -i -e 's/INTERFACESv4=""/INTERFACESv4="wlan0"/' -e 's/INTERFACESv6=""/INTERFACESv6="wlan0"/' ${ROOTFS_DIR}/etc/default/isc-dhcp-server
install -m 644 files/dhcpd.conf ${ROOTFS_DIR}/etc/dhcp/dhcpd.conf
