#!/bin/bash
set -e

#apt-get install nginx apache2-utils

cat > /etc/yum.repos.d/nginx.repo << EOF
[nginx]
name=nginx repo
baseurl=http://nginx.org/packages/centos/\$releasever/\$basearch/
gpgcheck=0
enabled=1
EOF

yum install nginx -y
#yum update && yum install httpd-tools-2.4.6-67.el7.centos.x86_64 -y
yum update && yum install httpd-tools -y

# mv ~/nginx-client.conf /etc/nginx/nginx.conf
