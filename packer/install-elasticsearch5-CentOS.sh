#!/bin/bash

# Get the PGP Key
#wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -
sudo rpm --import https://artifacts.elastic.co/GPG-KEY-elasticsearch
#echo "deb https://artifacts.elastic.co/packages/5.x/apt stable main" | tee -a /etc/apt/sources.list.d/elastic-5.x.list

# If installing the latest version of ElasticSearch, add code to create
# elasticsearch.repo file in the /etc/yum.repos.d directory

# Download ElasticSearch RPM and check fil integrity
wget https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-5.6.2.rpm
# Add code to modify elasticsearch-5.6.2.rpm.sha512 file and then use it to check file integrity
  #Modify file
# sha512sum -c elasticsearch-5.6.2.rpm.sha512

# Do I need to add steps to config it to start automatically?

if [ -z "$ES_VERSION" ]; then
    echo "Installing the latest Elasticsearch version"
    sudo yum install elasticsearch
else
    echo "Installing Elasticsearch version $ES_VERSION"
    sudo rpm --install elasticsearch-$ES_VERSION.rpm
fi

cd /usr/share/elasticsearch/
#bin/elasticsearch-plugin install --batch x-pack
sudo bin/elasticsearch-plugin install --batch x-pack
cd -

# Do I need to add a line to sudo su before running the mv line?
mv elasticsearch.yml /etc/elasticsearch/elasticsearch.yml
