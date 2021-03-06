#!/bin/bash -e

install -m 644 files/wlan0 ${ROOTFS_DIR}/etc/network/interfaces.d/wlan0

install -m 644 files/hostapd.conf ${ROOTFS_DIR}/etc/hostapd/hostapd.conf
sed -i 's/#DAEMON_CONF=""/DAEMON_CONF="\/etc\/hostapd\/hostapd.conf"/' ${ROOTFS_DIR}/etc/default/hostapd

# Prevent wpa_supplicant from grabbing our wlan0 interface
echo "disabled=1" >> ${ROOTFS_DIR}/etc/wpa_supplicant/wpa_supplicant.conf

# Install traffic forwarding config
install -m 644 files/30-ipforward.conf ${ROOTFS_DIR}/etc/sysctl.d/30-ipforward.conf

# Configure dnsmasq as DHCP server
install -m 644 files/wlan0.conf ${ROOTFS_DIR}/etc/dnsmasq.d/wlan0.conf

# Install our Tor configuration
sed -i 's|#%include /etc/torrc.d/|%include /etc/torrc.d/|' ${ROOTFS_DIR}/etc/tor/torrc
install -D -m 664 files/digiges-tor-config ${ROOTFS_DIR}/etc/torrc.d/digiges-tor-config
install -m 644 files/iptables.up.rules ${ROOTFS_DIR}/etc/iptables.up.rules
install -m 755 files/iptables ${ROOTFS_DIR}/etc/network/if-pre-up.d/iptables
