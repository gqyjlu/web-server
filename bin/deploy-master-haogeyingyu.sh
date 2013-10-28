#!/bin/bash

cd /web/web-server/
MAINPATH=`pwd`

mkdir -p ./dist/haogeyingyu/
rm -rf ./dist/haogeyingyu/*
cp ./build/haogeyingyu/*.pyc ./dist/haogeyingyu/

cd ${MAINPATH}/bin/
sh reconf-etc-haogeyingyu.sh
cd ${MAINPATH}/

nginx -t
nginx -s reload
supervisorctl reread
supervisorctl update
supervisorctl status
supervisorctl restart haogeyingyu:8501
supervisorctl restart haogeyingyu:8502

