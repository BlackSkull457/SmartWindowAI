#!/bin/bash

set -e

PROJECT="SmartWindowAI"

mkdir -p build

cd build

qmake ../${PROJECT}.pro

make -j$(nproc)

echo ""
echo "Build Complete"
echo ""

ls -lh
