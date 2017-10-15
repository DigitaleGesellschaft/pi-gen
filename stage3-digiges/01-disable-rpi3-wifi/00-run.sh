#!/bin/bash -e

install -m 644 files/blacklist-rpi3-wifi.conf ${ROOTFS_DIR}/etc/modprobe.d/blacklist-rpi3-wifi.conf
