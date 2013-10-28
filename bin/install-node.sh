#!/bin/bash

cd /web/web-server/
MAINPATH=`pwd`
mkdir -p ${MAINPATH}/logs

cd ${MAINPATH}/soft/

tar zxvf tornado-2.4.1.tar.gz
cd tornado-2.4.1/
python2.6 setup.py build
python2.6 setup.py install
cd ../
cd ${MAINPATH}/soft/
rm -rf tornado-2.4.1/

tar zxvf python-memcached-1.31.tar.gz 
cd python-memcached-1.31/
python2.6 setup.py install
cd ${MAINPATH}/soft/
rm -rf python-memcached-1.31/

tar zxvf redis-py.tar.gz 
cd redis-py/
python2.6 setup.py install
cd ${MAINPATH}/soft/
rm -rf redis-py/

tar zxvf psycopg2-2.5.tar.gz 
cd psycopg2-2.5/
python2.6 setup.py install
cd ${MAINPATH}/soft/
rm -rf psycopg2-2.5/

tar zxvf pymongo-2.5.tar.gz 
cd pymongo-2.5/
python2.6 setup.py install
cd ${MAINPATH}/soft/
rm -rf pymongo-2.5/

tar zxvf Jinja2-2.6.tar.gz 
cd Jinja2-2.6/
python2.6 setup.py install
cd ${MAINPATH}/soft/
rm -rf Jinja2-2.6/

tar zxvf tld-0.6.1.tar.gz 
cd tld-0.6.1/
python2.6 setup.py install
cd ${MAINPATH}/soft/
rm -rf tld-0.6.1/


