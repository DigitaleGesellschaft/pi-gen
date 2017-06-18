#!/bin/bash -e

set -e

export BASE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "Delete stages 3 to 5"
rm -rf ${BASE_DIR}/stage{3,4,5}

echo "Replace stage3 with the DigiGes scripts"
cp -ra ${BASE_DIR}/stage3-digiges ${BASE_DIR}/stage3

echo "Adapt image name"
echo "IMG_NAME=DigOnPi" > ${BASE_DIR}/config
