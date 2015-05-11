#!/bin/bash

set -e

MAJOR_VERSION=$1
MINOR_VERSION=$2
FILE=qt-everywhere-opensource-src-$MAJOR_VERSION.$MINOR_VERSION.tar.gz
PACKAGE="qt-$MAJOR_VERSION.$MINOR_VERSION-linux-x64.tar.gz"
DOWNLOAD=http://download.qt.io/official_releases/qt/$MAJOR_VERSION/$MAJOR_VERSION.$MINOR_VERSION/single/$FILE
cd /tmp
echo "Downloading source package: $DOWNLOAD"
wget -q $DOWNLOAD

echo "Extracting source package $FILE"
mkdir qt-src
tar zxvf $FILE > /dev/null
cd qt-everywhere-opensource-src-$MAJOR_VERSION.$MINOR_VERSION/
./configure --prefix=/app/.qtcs/Qt/$MAJOR_VERSION/gcc_64/ -opensource -confirm-license -no-xcb -no-compile-examples -skip qtmultimedia -skip qtsensors -skip qtwebkit
make
make install

cd /app/.qtcs/Qt/
echo "Cleaning up build"
rm -rf Docs/ Examples/ Tools/
echo "Creating package $PACKAGE"
tar -zcf $PACKAGE *
echo "Moving $PACKAGE to /build"
mv $PACKAGE /build
echo "Packaging complete, check local build/ directory for a fresh package :)"
