#!/usr/bin/env bash

ROOTPATH=/var/www/Eduard_Chat
PM2FILE=pm2.json
if [ "$1" == "development" ]; then
  ROOTPATH=/var/www/Eduard_Chat.dev
  PM2FILE=pm2.dev.json
fi

cd $ROOTPATH
curl -fSL "https://s3.amazonaws.com/rocketchatbuild/Eduard_Chat-develop.tgz" -o Eduard_Chat.tgz
tar zxf Eduard_Chat.tgz  &&  rm Eduard_Chat.tgz
cd $ROOTPATH/bundle/programs/server
npm install
pm2 startOrRestart $ROOTPATH/current/$PM2FILE
