#!/bin/sh

REDELINUX_USER_FOLDER='/home/bcc/fsouto/www/mac0499'

git clone https://github.com/fllsouto/mac0499.git
cd mac0499
ruby -v utils/set_template.rb
sh utils/deploy_page.sh $REDELINUX_USER_FOLDER
cd ..
rm -vrf mac0499/