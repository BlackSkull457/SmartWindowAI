#!/bin/bash

set -e

PROJECT="SmartWindowAI"

echo ""
echo "1. Linux"
echo "2. Windows"
echo ""

read -p "Target: " TARGET

case $TARGET in

1)

BUILD_DIR="build-linux"

rm -rf "$BUILD_DIR"
mkdir -p "$BUILD_DIR"

cd "$BUILD_DIR"

qmake ../${PROJECT}.pro \
    CONFIG+=release

make -j$(nproc)

echo ""
echo "Linux Build Complete"
;;

2)

BUILD_DIR="build-windows"

rm -rf "$BUILD_DIR"
mkdir -p "$BUILD_DIR"

cd "$BUILD_DIR"

qmake ../${PROJECT}.pro \
    CONFIG+=release

make -j$(nproc)

echo ""
echo "Windows Build Complete"
;;

*)

echo "Invalid Target"
exit 1
;;

esac
