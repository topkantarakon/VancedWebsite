#!/bin/sh
value=`cat buildversion.txt`
sed -i -e "s/{{buildNumber}}/$value/g" index.html