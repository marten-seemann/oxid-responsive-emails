#!/bin/bash
# This script should NOT be called manually.

SOURCEPATH=$1

IONCUBE_PATH="$HOME/bin/ioncube"
ENCODERS[0]="ioncube_encoder53"
ENCODERS[1]="ioncube_encoder55"

TARGETS[0]="encrypted_53"
TARGETS[1]="encrypted_55"

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )" #directory of the current script

SOURCECOMMENT="Copyright Marten Seemann, 2016"

source $DIR/encoder_config.sh

LENGTH=${#ENCODERS[@]}
LENGTH=$(expr $LENGTH - 1)

for i in $(seq 0 $LENGTH)
do
  ENCODER=$IONCUBE_PATH/${ENCODERS[$i]}
  TARGET=$DIR/${TARGETS[$i]}

  echo "Encoding $ENCODER into $TARGET"
  rm -rf $TARGET
  mkdir $TARGET

  $ENCODER $SOURCEPATH/* \
    --into $TARGET \
    --replace-target \
    --no-doc-comments \
    --add-comment "$SOURCECOMMENT" \
    --ignore "metadata.php" \
    --copy "inc/paths.php" \
    --copy "application/translations/*/*lang.php" \
    --with-license "license.txt" \
    --passphrase $PASSPHRASE

  $ENCODER $SOURCEPATH/copy_this/metadata.php \
    --into $TARGET/copy_this/ \
    --merge-target \
    --no-doc-comments \
    --add-comment "$SOURCECOMMENT" \
    --passphrase $PASSPHRASE
done
