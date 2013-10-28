#!/bin/bash

cd /web/web-server/
MAINPATH=`pwd`
mkdir -p ${MAINPATH}/logs

rm -rf /etc/redis.conf
ln -s ${MAINPATH}/etc/redis.conf /etc/redis.conf

rm -rf /etc/mongod.conf
ln -s ${MAINPATH}/etc/mongod.conf /etc/mongod.conf

rm -rf /usr/local/nginx/conf/nginx.conf
ln -s ${MAINPATH}/etc/nginx.conf /usr/local/nginx/conf/nginx.conf
rm -rf /usr/local/nginx/conf/nginx.conf.d/*.conf

rm /etc/supervisord.conf
ln -s ${MAINPATH}/etc/supervisord.conf /etc/supervisord.conf
rm -rf /etc/supervisord.conf.d/*.conf

rm -rf /usr/local/nginx/conf/nginx.conf.d/base
mkdir /usr/local/nginx/conf/nginx.conf.d/base

ln -s ${MAINPATH}/etc/nginx.ganglia.conf     /usr/local/nginx/conf/nginx.conf.d/base/nginx.ganglia.conf
ln -s ${MAINPATH}/etc/nginx.mongod.conf      /usr/local/nginx/conf/nginx.conf.d/base/nginx.mongod.conf
ln -s ${MAINPATH}/etc/nginx.supervisord.conf /usr/local/nginx/conf/nginx.conf.d/base/nginx.supervisord.conf
ln -s ${MAINPATH}/etc/nginx.test.conf        /usr/local/nginx/conf/nginx.conf.d/base/nginx.test.conf

rm -rf /etc/supervisord.conf.d/base
mkdir /etc/supervisord.conf.d/base
ln -s ${MAINPATH}/etc/supervisor.memcached.conf   /etc/supervisord.conf.d/base/supervisor.memcached.conf
ln -s ${MAINPATH}/etc/supervisor.redis.conf       /etc/supervisord.conf.d/base/supervisor.redis.conf
ln -s ${MAINPATH}/etc/supervisor.mongod.conf      /etc/supervisord.conf.d/base/supervisor.mongod.conf

