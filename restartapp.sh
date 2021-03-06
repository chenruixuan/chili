#!/bin/bash

PIDFILE="./app.pid"
ERRLOG="./err.log"
OUTLOG="./out.log"

if [ -f $PIDFILE ]; then
    kill `cat -- $PIDFILE`
    rm -f -- $PIDFILE
fi

exec python ./manage.py runfcgi --protocol=fcgi -h 127.0.0.1 -p 7777 --daemonize --pidfile=$PIDFILE --errlog=$ERRLOG --outlog=$OUTLOG
