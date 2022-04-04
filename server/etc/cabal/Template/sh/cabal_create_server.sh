#!/bin/sh

num=$1

for (( i=1; i<=$num; i++ ))
do
  leadingZero=""
  
  if [ $i -lt 10 ]
  then
    leadingZero="0"
  fi

  #Multiple
  let new_exp_rate=$EXP_RATE*100
  let new_sexp_rate=$SEXP_RATE*100
  let new_cexp_rate=$CEXP_RATE*100
  let new_drop_rate=$DROP_RATE*100
  let new_alz_rate=$ALZ_RATE*100
  let new_alzb_rate=$BALZ_RATE*100
  let new_pexp_rate=$PEXP_RATE*100
  let new_wexp_rate=$WEXP_RATE*100

  sed /etc/cabal/Data/Multiple.scp \
    -e "s/MEXP_RATE/$new_exp_rate/g" \
    -e "s/SEXP_RATE/$new_sexp_rate/g" \
    -e "s/CEXP_RATE/$new_cexp_rate/g" \
    -e "s/DROP_RATE/$new_drop_rate/g" \
    -e "s/MALZ_RATE/$new_alzb_rate/g" \
    -e "s/BALZ_RATE/$new_alz_rate/g" \
    -e "s/PEXP_RATE/$new_pexp_rate/g" \
    -e "s/WEXP_RATE/$new_wexp_rate/g" \
    > /etc/cabal/Data/Multiple.scp.tmp
    mv -f /etc/cabal/Data/Multiple.scp.tmp /etc/cabal/Data/Multiple.scp

  #Const
  sed /etc/cabal/Data/Const.scp \
  -e "s/ITEMS_PER_DROP/$ITEMS_PER_DROP/g" \
  > /etc/cabal/Data/Const.scp.tmp
  mv /etc/cabal/Data/Const.scp.tmp /etc/cabal/Data/Const.scp
  
  # DBAgent
  ln -sf /usr/bin/DBAgent /usr/bin/DBAgent_$leadingZero$i
  chmod 0700 /usr/bin/DBAgent_$leadingZero$i
  
  sed /etc/cabal/Template/conf/DBAgent_x.ini \
  -e "s/dbname/DBAgent_$leadingZero$i/g" \
  > /etc/cabal/DBAgent_$leadingZero$i.ini
  
  # PartySvr
  ln -sf /usr/bin/PartySvr /usr/bin/PartySvr_$leadingZero$i
  chmod 0700 /usr/bin/PartySvr_$leadingZero$i
  
  cp -rf /etc/cabal/Template/conf/PartySvr_x.ini /etc/cabal/PartySvr_$leadingZero$i.ini
  
  # ChatNode
  ln -sf /usr/bin/ChatNode /usr/bin/ChatNode_$leadingZero$i
  chmod 0700 /usr/bin/ChatNode_$leadingZero$i
  
  cp -rf /etc/cabal/Template/conf/ChatNode_x.ini /etc/cabal/ChatNode_$leadingZero$i.ini
  
  # LoginSvr
  ln -sf /usr/bin/LoginSvr /usr/bin/LoginSvr_$leadingZero$i
  chmod 0700 /usr/bin/LoginSvr_$leadingZero$i
  
  cp -rf /etc/cabal/Template/conf/LoginSvr_x.ini /etc/cabal/LoginSvr_$leadingZero$i.ini
  
  # AgentShop
  ln -sf /usr/bin/AgentShop /usr/bin/AgentShop_$leadingZero$i
  chmod 0700 /usr/bin/AgentShop_$leadingZero$i
  
  cp -rf /etc/cabal/Template/conf/AgentShop_x.ini /etc/cabal/AgentShop_$leadingZero$i.ini
  
done

ln -sf /usr/bin/DBAgent /usr/bin/GlobalDBAgent
ln -sf /usr/bin/DBAgent /usr/bin/CashDBAgent
ln -sf /usr/bin/DBAgent /usr/bin/EventDBAgent
ln -sf /usr/bin/DBAgent /usr/bin/PCBangDBAgent

chmod 0700 /usr/bin/GlobalDBAgent
chmod 0700 /usr/bin/AuthDBAgent
chmod 0700 /usr/bin/CashDBAgent
chmod 0700 /usr/bin/EventDBAgent
chmod 0700 /usr/bin/PCBangDBAgent
chmod 0700 /usr/bin/RockAndRollITS
chmod 0700 /usr/bin/GlobalMgrSvr
chmod 0700 /usr/bin/EventMgrSvr

cp -rf /etc/cabal/Template/conf/Common.ini /etc/cabal/
cp -rf /etc/cabal/Template/conf/GlobalDBAgent.ini /etc/cabal/
cp -rf /etc/cabal/Template/conf/AuthDBAgent.ini /etc/cabal/
cp -rf /etc/cabal/Template/conf/CashDBAgent.ini /etc/cabal/
cp -rf /etc/cabal/Template/conf/EventDBAgent.ini /etc/cabal/
cp -rf /etc/cabal/Template/conf/PCBangDBAgent.ini /etc/cabal/
cp -rf /etc/cabal/Template/conf/RockAndRollITS.ini /etc/cabal/
cp -rf /etc/cabal/Template/conf/GlobalMgrSvr.ini /etc/cabal/
cp -rf /etc/cabal/Template/conf/EventMgrSvr.ini /etc/cabal/