#!/bin/sh
mkdir -p /mongodb/data/log
mongod --fork --logpath /mongodb/data/log/mongod.log --dbpath /mongodb/data
node $1