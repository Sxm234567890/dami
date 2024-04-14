#关闭防火墙
sed -i 's/^SELINUX=.*/SELINUX=disabled/' /etc/selinux/config 
setenforce 0
systemctl stop firewalld
systemctl disable firewalld.service

#下载相关软件包
yum -y install httpd mariadb-server mariadb php php-mysql gd php-gd
#systemctl start httpd mariadb
#systemctl enable httpd mariadb
systemctl start mysqld httpd
systemctl enable mysqld httpd


mkdir -p/webroot/discuz
unzip  Discuz_X3.5_SC_UTF8_20231001.zip  #我下载的是这个源码包，给的也是这个源码包的地址 
cp -rf upload/* /webroot/discuz/
chown -R apache.apache /webroot/discuz/
mv discuz.conf /etc/httpd/conf.d/discuz.conf

#MYSQL_USER="mysql"
MYSQL_PASSWORD="Sxm@325468"

DATABASE_NAME="discuz"
mysql -uroot -p"$MYSQL_PASSWORD"<<EOF
CREATE DATABASE $DATABASE_NAME;
EOF

 
