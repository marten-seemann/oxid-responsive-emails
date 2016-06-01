#!/bin/bash
ZIP=/usr/bin/zip
FILENAME="responsive_email.zip"
MODULEPATH="modules/responsive_email"

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )" #directory of the current script

echo "Splitting into copy_this and changed_full"
cd $DIR
rm -rf package
mkdir package
cd package
mkdir -p copy_this/$MODULEPATH changed_full/$MODULEPATH
cp -r $DIR/productive/* copy_this/$MODULEPATH
mv copy_this/$MODULEPATH/modified changed_full/$MODULEPATH
mkdir changed_full/$MODULEPATH/modified/html
mv copy_this/$MODULEPATH/sql .

echo "Adding install instructions..."
cp $DIR/install_instruction/README.txt .

echo "Compressing to $FILENAME..."
rm -f ../$FILENAME
$ZIP -r -9 -q ../$FILENAME *
cd ..
rm -r package/
