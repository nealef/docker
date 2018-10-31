#!/bin/sh
yum install git -y
git clone https://github.com/Joao-Henrique/React_Express_App_Medium_Tutorial.git
cd React_Express_App_Medium_Tutorial/api
npm install
cd ../client
npm install
cd ..
tar -czf /volume/react-api.tar.gz --exclude-vcs api
tar -czf /volume/react-client.tar.gz --exclude-vcs client
exit
