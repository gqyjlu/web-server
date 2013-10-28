#!/bin/bash

cd /web/web-server/
MAINPATH=`pwd`

rm -rf /usr/local/nginx/conf/nginx.conf.d/haogeyingyu
mkdir -p /usr/local/nginx/conf/nginx.conf.d/haogeyingyu
ln -s ${MAINPATH}/etc/nginx.haogeyingyu.conf /usr/local/nginx/conf/nginx.conf.d/haogeyingyu/nginx.haogeyingyu.conf

rm -rf /etc/supervisord.conf.d/haogeyingyu
mkdir /etc/supervisord.conf.d/haogeyingyu
ln -s ${MAINPATH}/etc/supervisor.haogeyingyu.conf /etc/supervisord.conf.d/haogeyingyu/supervisor.haogeyingyu.conf

