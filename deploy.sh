#!/bin/bash
echo "***********[ Removing IP from logs ]***********"
ssh $SERVER_USERNAME@$SERVER_NAME "echo Hidden" > /dev/null 2>&1
echo "***********[ Running the update Docker for the site ]***********"
ssh $SERVER_USERNAME@$SERVER_NAME "docker run --rm -v $WEB_PATH:/git-project $UPDATE_DOCKER_NAME"

BUILD_VERSION_PATH="$WEB_PATH/buildversion.txt"
COMMIT_NUMBER_PATH="$WEB_PATH/commitNumber.txt"
echo "***********[ Update the build number for the site ]***********"
ssh $SERVER_USERNAME@$SERVER_NAME "echo $TRAVIS_BUILD_NUMBER > $BUILD_VERSION_PATH"
ssh $SERVER_USERNAME@$SERVER_NAME "echo $TRAVIS_COMMIT > $COMMIT_NUMBER_PATH"
ssh $SERVER_USERNAME@$SERVER_NAME ".$WEB_PATH/buildinfo.sh"
echo "***********[ Removing the added version files so git pull doesn't fail next time ]***********"
ssh $SERVER_USERNAME@$SERVER_NAME "rm -f $BUILD_VERSION_PATH"
ssh $SERVER_USERNAME@$SERVER_NAME "rm -f $COMMIT_NUMBER_PATH"
