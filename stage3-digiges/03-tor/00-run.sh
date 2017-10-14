#!/bin/bash -e

# Set up official Tor repository
install -m 644  files/tor.list ${ROOTFS_DIR}/etc/apt/sources.list.d/tor.list
on_chroot apt-key add - < files/deb.torproject.org-archive-signing-key-2017-10-15_00-25-43.asc
on_chroot << EOF
apt-get update
EOF
