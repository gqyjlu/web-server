#!/bin/bash

cd /web/web-server/
MAINPATH=`pwd`

rm -rf ${MAINPATH}/etc/nginx.conf
cp ${MAINPATH}/etc/nginx.conf.template ${MAINPATH}/etc/nginx.conf
sed -i "s/{PCENT}//g" ${MAINPATH}/etc/nginx.conf
sed -i "s/{PMAC}/#/g" ${MAINPATH}/etc/nginx.conf

cd ${MAINPATH}/bin/
sh install-etc-base.sh
cd ${MAINPATH}/

nginx -t
nginx -s reload
supervisorctl reread
supervisorctl update
supervisorctl status
supervisorctl restart memcached:8001
supervisorctl restart redis:8002
supervisorctl restart mongod:8003

