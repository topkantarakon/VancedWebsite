#!/bin/sh
buildVersion=`cat buildVersion.txt`
commitNumber=`cat commitNumber.txt`
sed -i -e "s/{{buildNumber}}/$buildVersion/g" index.html
sed -i -e "s/{{commitNumber}}/$commitNumber/g" index.html