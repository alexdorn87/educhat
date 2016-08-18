#!/usr/bin/env bash

export METEOR_SETTINGS=$(cat settings.json)
meteor add rocketchat:internal-hubot meteorhacks:kadira
meteor build --server https://demo.Eduard_Chat --directory /var/www/Eduard_Chat
cd /var/www/Eduard_Chat/bundle/programs/server
npm install
cd /var/www/Eduard_Chat/current
pm2 startOrRestart /var/www/Eduard_Chat/current/pm2.json
