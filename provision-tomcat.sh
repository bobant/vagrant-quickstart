#!/bin/bash

apt-get update -y
apt-get upgrade -y
apt-get install -y nano git openjdk-7-jdk openjdk-7-jre-headless

cd /usr/local
wget http://www-us.apache.org/dist/tomcat/tomcat-8/v8.0.38/bin/apache-tomcat-8.0.38.tar.gz
tar -xzvf apache-tomcat-8.0.38.tar.gz
ln -s apache-tomcat-8.0.38 tomcat


cp /vagrant/tomcat8 /etc/init.d
chmod 755 /etc/init.d/tomcat8

groupadd tomcat
useradd -s /bin/false -g tomcat -d /usr/local/tomcat tomcat
cd /usr/local/tomcat
chgrp -R tomcat conf
chmod g+rwx conf
chmod g+r conf/*
chown -R tomcat work/ temp/ logs/

update-rc.d tomcat8 defaults
service tomcat8 start
