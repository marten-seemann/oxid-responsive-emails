#!/bin/bash
GETSQL="http://roxid.localhost:8369/modules/responsive_email/build/getsql.php"

CURL=/usr/bin/curl
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )" #directory of the current script


mkdir -p $DIR/sql
cd $DIR/sql
mkdir single

echo "Reading database records..."
$CURL $GETSQL

echo "Combining into a single file..."
cat single/*.sql > combined.sql
rm -r single
