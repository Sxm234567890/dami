#!/bin/bash
yum install epel-release yum-utils
#yum install http://rpms.remirepo.net/enterprise/remi-release-7.rpm
yum -y install wget
wegt  http://rpms.remirepo.net/enterprise/remi-release-7.rpm

yum-config-manager --enable remi-php74
yum install php php-cli php-fpm php-mysqlnd php-zip php-devel php-gd php-mcrypt php-mbstring php-curl php-xml php-pear
systemctl restart httpd
