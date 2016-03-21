#!/bin/bash
ZIP=/usr/bin/zip
FILENAME="responsive_email.zip"

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )" #directory of the current script

echo "Splitting into copy_this and changed_full"
cd $DIR
rm -rf package
mkdir package
cd package
mkdir copy_this changed_full
cp -r $DIR/productive/* copy_this/
mv copy_this/modified changed_full/
mkdir changed_full/modified/html
mv copy_this/sql .

echo "Adding install instructions..."
cp $DIR/install_instruction/README.txt .

echo "Compressing to $FILENAME..."
rm -f ../$FILENAME
$ZIP -r -9 -q ../$FILENAME *
cd ..
rm -r package/
