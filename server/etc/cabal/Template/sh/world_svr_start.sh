#!/bin/sh

trap "exit" SIGINT SIGTERM;

CHANEL=$1
IN_TIME=$2

if [[ $IN_TIME == "0" ]]
then
    exec $CHANEL -l -c
else
    $CHANEL
    sleep "${IN_TIME}m" && kill 1
fi