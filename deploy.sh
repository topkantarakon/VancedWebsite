#!/bin/bash
echo "***********[ Removing IP from logs ]***********"
ssh $SERVER_USERNAME@$SERVER_NAME "echo Hidden" > /dev/null 2>&1
echo "***********[ Running the update Docker for the site ]***********"
ssh $SERVER_USERNAME@$SERVER_NAME "docker run --rm -v $WEB_PATH:/git-project $UPDATE_DOCKER_NAME"
echo "***********[ Update the build number for the site ]***********"
ssh $SERVER_USERNAME@$SERVER_NAME "echo build-$TRAVIS_BUILD_NUMBER > $WEB_PATH/buildversion.txt"
ssh $SERVER_USERNAME@$SERVER_NAME "chmod +x $WEB_PATH/buildnumbers.sh"
ssh $SERVER_USERNAME@$SERVER_NAME ".$WEB_PATH/buildnumbers.sh"
