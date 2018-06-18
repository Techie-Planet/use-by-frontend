#!/bin/sh
npm install -g envreplace
if [ ! -f /usr/share/nginx/html/openlmis.js ]; then
    echo "File openlmis not found!"
else
    echo "File openlmis found"
fi
echo "BATCH_APPROVE_SCREEN"
echo $BATCH_APPROVE_SCREEN
envreplace /usr/share/nginx/html/openlmis.js

node consul/registration.js -c register -f consul/config.json
nginx -g 'daemon off;'
