#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )" #directory of the current script

cd build

rm -rf tmp productive
mkdir tmp
cd tmp

echo "Retrieving code from GIT repo..."
git clone --quiet ../.. .
rm -rf .git .gitignore README.md sql/ build/

cd ..
mv tmp productive

echo "Encode ROXID with IonCube"
$DIR/encoder/encode.sh | sed 's/^/   /'
