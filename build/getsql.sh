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
cat single/*.sql > combined.sql.tmp
# cat combined.sql.tmp | sed 's/\\\\\\/\\/g' > combined.sql
mv combined.sql.tmp combined.sql
# cat combined.sql.tmp | sed 's/\\r/\\\\r/g' | sed 's/\\n/\\\\n/g' > combined.sql
