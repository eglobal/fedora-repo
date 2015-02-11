#!/usr/bin/env bash

# system and apps
apt-get update
apt-get dist-upgrade
apt-get install -y vim build-essential curl git-core libssl-dev htop openjdk-7-jre-headless tomcat7 tomcat7-admin

# user login shell initialization script
cp /vagrant/vagrant/bash_profile /home/vagrant/.profile

#tomcat configuration
mkdir /home/vagrant/fedora-data
chown tomcat7:tomcat7 /home/vagrant/fedora-data
echo 'JAVA_OPTS="${JAVA_OPTS} -Dfcrepo.home=/home/vagrant/fedora-data"' >> /etc/default/tomcat7
cp /vagrant/vagrant/tomcat/tomcat-users.xml /etc/tomcat7/tomcat-users.xml
service tomcat7 restart

#download/install fedora WAR
wget http://repo1.maven.org/maven2/org/fcrepo/fcrepo-webapp/4.1.0/fcrepo-webapp-4.1.0.war
mv fcrepo-webapp-4.1.0.war /var/lib/tomcat7/webapps/
