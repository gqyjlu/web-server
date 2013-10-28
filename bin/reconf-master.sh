#!/bin/bash

cd /web/web-server/
MAINPATH=`pwd`
mkdir -p ${MAINPATH}/logs

cd ${MAINPATH}/soft/mongodb-linux-x86_64-2.4.2/
rm -rf /usr/local/mongodb
ln -s `pwd` /usr/local/mongodb
cd ${MAINPATH}/soft/

rm -rf ${MAINPATH}/etc/nginx.conf
cp ${MAINPATH}/etc/nginx.conf.template ${MAINPATH}/etc/nginx.conf
sed -i "s/{PCENT}//g" ${MAINPATH}/etc/nginx.conf

cd ${MAINPATH}/bin/
sh install-etc-base.sh
sh reconf-etc-haogeyingyu.sh

