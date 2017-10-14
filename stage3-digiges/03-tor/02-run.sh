#!/bin/bash -e

# Install our Tor configuration
sed -i 's|#%include /etc/torrc.d/|%include /etc/torrc.d/|' ${ROOTFS_DIR}/etc/tor/torrc
install -D -m 664 files/digiges-tor-config ${ROOTFS_DIR}/etc/torrc.d/digiges-tor-config
install -m 644 files/iptables.up.rules ${ROOTFS_DIR}/etc/iptables.up.rules
