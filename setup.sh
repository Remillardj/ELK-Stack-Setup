#!/bin/bash

# This is assuming we are running on sudo
# But because people won't read often, let's check for them
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root"
   exit 1
fi

# update yum
yum update
yum update -y

# Verify cwd
cd ~/

# Make a directory for JDK
mkdir jdk
cd ./jdk/


# Install Elasticsearch
wget https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-5.6.5.rpm
rpm -ivh elasticsearch-5.6.5.rpm
systemctl enable elasticsearch.service
 
# Install Kibana
wget https://artifacts.elastic.co/downloads/kibana/kibana-5.6.5-x86_64.rpm
rpm -ivh kibana-5.6.5-x86_64.rpm
systemctl enable kibana.service
 
# Install Logstach
wget https://artifacts.elastic.co/downloads/logstash/logstash-5.6.5.rpm
rpm -ivh logstash-5.6.5.rpm
systemctl enable logstash.service
