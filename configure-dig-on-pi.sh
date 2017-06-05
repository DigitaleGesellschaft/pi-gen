#!/bin/bash -e

set -e

export BASE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "Disable stages 3 to 5"
touch ${BASE_DIR}/stage{3,4,5}/SKIP

echo "Remove unwanted image and noobs exports"
rm -f ${BASE_DIR}/stage{4,5}/EXPORT_IMAGE
rm -f ${BASE_DIR}/stage*/EXPORT_NOOBS

echo "Adapt image name"
echo "IMG_NAME=DigOnPi" > ${BASE_DIR}/config
