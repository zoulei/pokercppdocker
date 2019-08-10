#!/usr/bin/env bash
apt clean
apt update
apt install -y htop unzip
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 68818C72E52529D4
echo "deb http://repo.mongodb.org/apt/ubuntu bionic/mongodb-org/4.0 multiverse" | tee /etc/apt/sources.list.d/mongodb-org-4.0.list
apt update
apt install -y mongodb-org
systemctl start mongod
systemctl enable mongod
rm tempmongoscript.js
echo -e 'use admin\ndb.createUser({user: "cltreedb",pwd: "Wv8Yg5gJD",roles: [ { role: "userAdminAnyDatabase", db: "admin" }, "readWriteAnyDatabase" ]})\n' >> tempmongoscript.js
mongo < tempmongoscript.js
cd /home/zoul15/
unzip mongodbbackup.zip
mongorestore mongodbbackup
apt update
apt upgrade -y
apt install build-essential python-dev python-pip -y
pip install virtualenv
mkdir -p /var/www/pokerweb
cd /var/www/pokerweb
virtualenv .env --no-site-packages
source .env/bin/activate
pip install flask
pip install pymongo
deactivate
apt-get install nginx uwsgi uwsgi-plugin-python -y
cd /tmp/
touch pokerweb.sock
chown www-data pokerweb.sock
cd /etc/nginx/sites-available
rm default
rm /etc/nginx/sites-enabled/default

echo -e 'server {
    listen 80;
    server_tokens off;
    server_name www.pokerweb.com pokerweb.com;

     location / {
         include uwsgi_params;
         uwsgi_pass unix:/tmp/pokerweb.sock;
     }

     location /static {
         alias /var/www/pokerweb/static;
     }
}' >> /etc/nginx/sites-available/pokerweb
ln -s /etc/nginx/sites-available/pokerweb /etc/nginx/sites-enabled/pokerweb

echo -e "[uwsgi]
vhost = true
socket = /tmp/pokerweb.sock
venv = /var/www/pokerweb/.env
chdir = /var/www/pokerweb
module = pmserver
callable = app" >> /etc/uwsgi/apps-available/pokerweb.ini

ln -s /etc/uwsgi/apps-available/pokerweb.ini /etc/uwsgi/apps-enabled/pokerweb.ini

systemctl restart nginx
systemctl restart uwsgi





#cd /home/zoul15/pokercppdocker/run
#apt-get update
#apt-get install -y apt-transport-https ca-certificates curl gnupg-agent software-properties-common
#curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
#apt-key fingerprint 0EBFCD88
#add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
#apt-get update
#apt-get install -y docker-ce docker-ce-cli containerd.io
#docker run hello-world