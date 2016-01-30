#!/bin/bash
ZIP=/usr/bin/zip
FILENAME="responsive_email.zip"

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )" #directory of the current script

echo "Splitting into copy_this and changed_full"
cd $DIR
rm -rf package_unenc
mkdir package_unenc
cd package_unenc
mkdir copy_this changed_full
cp -r $DIR/productive/* copy_this/
mv copy_this/modified changed_full/
mv copy_this/sql .
cd $DIR

echo "Encode ROXID with IonCube"
$DIR/encoder/encode.sh $DIR/package_unenc | sed 's/^/   /'

# delete directory containing the unencrypted install files
rm -rf package_unenc

echo "Copying encrypted files..."
cd $DIR
rm -rf package
mkdir package
cd package
cp -r ../encoder/encrypted_53 "PHP ab 5.3"
cp -r ../encoder/encrypted_55 "PHP ab 5.5"


echo "Compressing to $FILENAME..."
pwd
rm -f ../$FILENAME
$ZIP -r -9 -q ../$FILENAME *
cd ..
rm -r package/
