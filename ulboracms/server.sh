#!/bin/sh
cd /ulboracms
mongod --fork --logpath /mongodb/data/log/mongod.log --dbpath /mongodb/data --smallfiles --noprealloc --httpinterface --rest
node server.js
