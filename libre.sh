#!/bin/sh
# https://stackoverflow.com/a/48280659/7092954
find ./tools/templates/pkg_repos/ -type f | perl -pe 'print $_; s/pfSense/libreSense/' | xargs -n2 sudo mv
# https://askubuntu.com/a/879323
perl -pe 's/"product_name" => "pfSense"/"product_name" => "libreSense"/g' ./src/etc/inc/globals.inc
perl -pe 's/PFSENSE_REPOS=  pfSense-repo pfSense-repo-devel pfSense-repo-244/PFSENSE_REPOS=  libreSense-repo libreSense-repo-devel libreSense-repo-244/g' ./tools/conf/pfPorts/make.conf
sudo mv ./src/usr/local/share/pfSense ./src/usr/local/share/libreSense
find ./src/etc/ -type f | perl -pe 'print $_; s/pfSense/libreSense/' | xargs -n2 sudo mv
