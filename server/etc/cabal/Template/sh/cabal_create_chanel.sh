#!/bin/sh

serveridx=$1
chanelidx=$2

if [ $serveridx -gt 1 ]
then
  index=$(( 10 * $serveridx ))
else 
  index=0
fi

port=$((38110+$chanelidx+$index))

if [ $chanelidx -lt 10 ]
then
  chanelZero="0"
else
  chanelZero=""
fi

if [ $serveridx -lt 10 ]
then
  serverZero="0"
else
  serverZero=""
fi


ln -sf /usr/bin/WorldSvr /usr/bin/WorldSvr_${serverZero}${serveridx}_${chanelZero}${chanelidx}
chmod 0700 /usr/bin/WorldSvr_${serverZero}${serveridx}_${chanelZero}${chanelidx}

sed /etc/cabal/Template/conf/WorldSvr_x.ini \
-e "s/server_idx/$serveridx/g" \
-e "s/channel_idx/$chanelidx/g" \
-e "s/chanel_port/$port/g" \
-e "s/.*IPAddress=.*/IPAddress=$CONNECT_IP/g" \
-e "s/.*AddrForClient=.*/AddrForClient=$CONNECT_IP/g" \
> /etc/cabal/WorldSvr_${serverZero}${serveridx}_${chanelZero}${chanelidx}.ini