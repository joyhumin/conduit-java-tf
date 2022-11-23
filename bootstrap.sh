#!/bin/bash

yum update -y

# install docker and Docker Compose
yum install docker -y
service docker start
sudo usermod -aG docker $USER

curl -L https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose

sudo chmod +x /usr/local/bin/docker-compose

# sync all project file
#rsync -r ~/Documents/Projects/java/conduit_typescript_java_bdd/ ec2-user@3.27.64.104:/home/ec2-user/app
#-e "ssh -i joy-learning-terraform-key-pair.pem"
