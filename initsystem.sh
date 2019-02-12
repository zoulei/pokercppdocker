#!/usr/bin/env bash
apt clean
apt update
apt install -y htop unzip
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 9DA31620334BD75D9DCB49F368818C72E52529D4
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/4.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.0.list
apt update
apt install -y mongodb-org
service mongod start
rm tempmongoscript.js
echo -e 'use admin\ndb.createUser({user: "cltreedb",pwd: "Wv8Yg5gJD",roles: [ { role: "userAdminAnyDatabase", db: "admin" }, "readWriteAnyDatabase" ]})\n' >> tempmongoscript.js
mongo < tempmongoscript.js
cd /home/zoul15/
unzip mongodbbackup.zip
mongorestore mongodbbackup
cd /home/zoul15/pccppdocker/run
apt-get update
apt-get install -y apt-transport-https ca-certificates curl gnupg-agent software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
apt-key fingerprint 0EBFCD88
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
apt-get update
apt-get install -y docker-ce docker-ce-cli containerd.io
docker run hello-world