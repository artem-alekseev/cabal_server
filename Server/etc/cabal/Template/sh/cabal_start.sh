#!/bin/sh

countdown() (
  IFS=:
  set -- $*
  secs=$(( ${1#0} * 3600 + ${2#0} * 60 + ${3#0} ))
  while [ $secs -gt 0 ]
  do
    sleep 1 & echo -e -n "\033[1;33m"
    printf "\rWaiting for GlobalMgrSvr: [ %02d:%02d:%02d ]" $((secs/3600)) $(( (secs/60)%60)) $((secs%60)) 
echo -e -n "\033[0m"
    secs=$(( $secs - 1 ))
    wait
  done
  echo
)

echo -e "Starting GlobalDBAgent..." && usr/bin/GlobalDBAgent && sleep 1
echo -e "Starting AuthDBAgent..." && usr/bin/AuthDBAgent && sleep 1
echo -e "Starting CashDBAgent..." && usr/bin/CashDBAgent && sleep 1
echo -e "Starting EventDBAgent..." && usr/bin/EventDBAgent && sleep 1
echo -e "Starting PCBangDBAgent..." && usr/bin/PCBangDBAgent && sleep 1

FILES=/etc/cabal/DBAgent_*.ini
for f in $FILES
do
  out=${f/'/etc/cabal/'/}
  out=${out/'.ini'/}
  echo -e "Starting $out..." && usr/bin/$out && sleep 1
done

echo -e "Starting RockAndRollITS..." && usr/bin/RockAndRollITS && sleep 1
echo -e "Starting GlobalMgrSvr..." && usr/bin/GlobalMgrSvr && sleep 1
countdown "00:00:12" 

FILES=/etc/cabal/PartySvr_*.ini
for f in $FILES
do
  out=${f/'/etc/cabal/'/}
  out=${out/'.ini'/}
  echo -e "Starting $out..." && usr/bin/$out && sleep 1
done

FILES=/etc/cabal/ChatNode_*.ini
for f in $FILES
do
  out=${f/'/etc/cabal/'/}
  out=${out/'.ini'/}
  echo -e "Starting $out..." && usr/bin/$out && sleep 1
done

echo -e "Starting EventMgrSvr..." && usr/bin/EventMgrSvr && sleep 1

FILES=/etc/cabal/LoginSvr_*.ini
for f in $FILES
do
  out=${f/'/etc/cabal/'/}
  out=${out/'.ini'/}
  echo -e "Starting $out..." && usr/bin/$out && sleep 1
done

FILES=/etc/cabal/AgentShop_*.ini
for f in $FILES
do
  out=${f/'/etc/cabal/'/}
  out=${out/'.ini'/}
  echo -e "Starting $out..." && usr/bin/$out && sleep 1
done

FILES=/etc/cabal/WorldSvr_*.ini
for f in $FILES
do
  out=${f/'/etc/cabal/'/}
  out=${out/'.ini'/}
  echo -e "Starting $out..." && usr/bin/$out && sleep 1
done

exec /usr/sbin/init