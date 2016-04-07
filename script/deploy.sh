#!/bin/bash
set -x
echo "Starting TCC Page Deploy"
cd $(dirname "${BASH_SOURCE}")
tar -xzf package.tar.gz
rm package.tar.gz

mv _site mac0499
rm -rf mac0499_old
cp -r ../www/mac0499 mac0499_old
rm -rf ../www/mac0499
mv mac0499 ../www/

echo "Finished TCC Page Deploy!"