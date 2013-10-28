#!/bin/bash

#rm -rf /data
mkdir /web/data
cd /web/data/
mkdir /web/data/redis
mkdir /web/data/mongodb
chown -R nobody /web/data

cd /web/web-server/
MAINPATH=`pwd`

rm -rf ${MAINPATH}/logs
mkdir ${MAINPATH}/logs

easy_install supervisor
rm -rf /etc/supervisord.conf
echo_supervisord_conf > /etc/supervisord.conf

cd ${MAINPATH}/soft/

tar xvzf nginx-1.3.13.tar.gz
cd nginx-1.3.13/
./configure --prefix=/usr/local/nginx --with-http_ssl_module
make
make install
cd ${MAINPATH}/soft/
rm -rf nginx-1.3.13/
echo "export PATH=\$PATH:/usr/local/nginx/sbin" >> ~/.bash_profile
#htpasswd -bc ${MAINPATH}/etc/htpasswd 用户名 密码

tar zxvf libevent-2.0.21-stable.tar.gz 
cd libevent-2.0.21-stable/
./configure 
make
make install
cd ${MAINPATH}/soft/
rm -rf libevent-2.0.21-stable/

tar zxvf memcached-1.4.15.tar.gz 
cd memcached-1.4.15/
./configure 
make
make install
cd ${MAINPATH}/soft/
rm -rf memcached-1.4.15/

tar zxvf redis-2.6.12.tar.gz 
cd redis-2.6.12
make
make install
cd ${MAINPATH}/soft/
rm -rf redis-2.6.12

cd mongodb-linux-x86_64-2.4.2/
rm -rf /usr/local/mongodb
ln -s `pwd` /usr/local/mongodb
echo "export PATH=\$PATH:/usr/local/mongodb/bin" >> ~/.bash_profile
cd ${MAINPATH}/soft/


rm -rf /etc/httpd/conf/httpd.conf
ln -s ${MAINPATH}/etc/httpd.conf /etc/httpd/conf/httpd.conf
rm -rf /etc/httpd/conf.d/httpd.ganglia.conf
ln -s ${MAINPATH}/etc/httpd.ganglia.conf /etc/httpd/conf.d/http.ganglia.conf

rm -rf ${MAINPATH}/etc/nginx.conf
cp ${MAINPATH}/etc/nginx.conf.template ${MAINPATH}/etc/nginx.conf
sed -i "s/{PCENT}//g" ${MAINPATH}/etc/nginx.conf
sed -i "s/{PMAC}/#/g" ${MAINPATH}/etc/nginx.conf

cd ${MAINPATH}/bin/
sh install-etc-base.sh

cd ${MAINPATH}/bin/
sh install-node.sh

