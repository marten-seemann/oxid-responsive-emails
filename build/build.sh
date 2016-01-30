#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )" #directory of the current script

cd build

rm -rf tmp productive
mkdir tmp
cd tmp

echo "Retrieving code from GIT repo..."
git clone --quiet ../.. .


# build
cp -r $DIR/../node_modules . # save time by copying the node_modules folder from the dev version
npm install
grunt

mv build/sql .

rm -rf .git .gitignore composer.json composer.lock Gruntfile.coffee node_modules package.json
rm -rf email/src email/dest/css/*.diff
rm -rf README.md backend_email/ build/

cd ..
mv tmp productive
