#!/bin/bash
IONCUBE_PATH="/Users/marten/bin/ioncube"
# ENCODERS[0]="ioncube_encoder5"
# ENCODERS[1]="ioncube_encoder5_7.0"
ENCODERS[0]="ioncube_encoder53"
ENCODERS[1]="ioncube_encoder53_7.0"
ENCODERS[2]="ioncube_encoder54"

# TARGETS[0]="encrypted_5"
# TARGETS[1]="encrypted_5_7.0"
TARGETS[0]="encrypted_53"
TARGETS[1]="encrypted_53_7.0"
TARGETS[2]="encrypted_54"

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )" #directory of the current script

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

  $ENCODER $DIR/../productive/* \
    --into $TARGET \
    --replace-target \
    --no-doc-comments \
    --add-comment "Copyright Marten Seemann, 2013" \
    --copy "csstoinline/*.php" \
    --copy "out/admin/*/*lang.php" \
    --with-license "license.txt" \
    --passphrase $PASSPHRASE
done

wait
