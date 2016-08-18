#!/bin/bash
set -x
set -euvo pipefail
IFS=$'\n\t'

# ROCKET_DEPLOY_DIR="/tmp/deploy"
#TRAVIS_TAG=0.1.0

FILENAME="$ROCKET_DEPLOY_DIR/Eduard_Chat-$ARTIFACT_NAME.tgz";

ln -s /tmp/build/Eduard_Chat.tar.gz "$FILENAME"
gpg --armor --detach-sign "$FILENAME"
