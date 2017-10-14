#!/bin/bash -e

set -e

export BASE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "Delete stages 3 to 5"
rm -rf ${BASE_DIR}/stage{3,4,5}

echo "Replace stage3 with the DigiGes scripts"
cp -ra ${BASE_DIR}/stage3-digiges ${BASE_DIR}/stage3

echo "Adapt image name"
echo "IMG_NAME=DigOnPi" > ${BASE_DIR}/config

# Speed up build: Remove build tools from image
sed -i "/build-essential manpages-dev python bash-completion gdb pkg-config/d" ${BASE_DIR}/stage2/01-sys-tweaks/00-packages
sed -i "/libraspberrypi-dev libraspberrypi-doc libfreetype6-dev/d" ${BASE_DIR}/stage2/01-sys-tweaks/00-packages

# Remove attack surface: Remove service avahi-daemon
sed -i "/avahi-daemon/d" ${BASE_DIR}/stage2/01-sys-tweaks/00-packages

# Speed up build: Remove NOOBS exports
rm -f ${BASE_DIR}/stage2/EXPORT_NOOBS
