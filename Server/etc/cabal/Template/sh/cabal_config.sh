#!/bin/sh

cip=$1
dbpw=$2
dbip="mssql"
dbport="1433"
dbuser="sa"

sed /etc/cabal/Template/conf/odbc.ini \
-e "s/dbip/$dbip/g" \
-e "s/dbport/$dbport/g" \
> /etc/odbc.ini

sed /etc/cabal/AuthDBAgent.ini \
-e "s/.*DBId=.*/DBId=$dbuser/g" \
-e "s/.*DBPwd=.*/DBPwd=$dbpw/g" \
> /etc/cabal/AuthDBAgent.ini.tmp
mv /etc/cabal/AuthDBAgent.ini.tmp /etc/cabal/AuthDBAgent.ini

sed /etc/cabal/CashDBAgent.ini \
-e "s/.*DBId=.*/DBId=$dbuser/g" \
-e "s/.*DBPwd=.*/DBPwd=$dbpw/g" \
> /etc/cabal/CashDBAgent.ini.tmp
mv /etc/cabal/CashDBAgent.ini.tmp /etc/cabal/CashDBAgent.ini

sed /etc/cabal/EventDBAgent.ini \
-e "s/.*DBId=.*/DBId=$dbuser/g" \
-e "s/.*DBPwd=.*/DBPwd=$dbpw/g" \
> /etc/cabal/EventDBAgent.ini.tmp
mv /etc/cabal/EventDBAgent.ini.tmp /etc/cabal/EventDBAgent.ini

sed /etc/cabal/GlobalDBAgent.ini \
-e "s/.*DBId=.*/DBId=$dbuser/g" \
-e "s/.*DBPwd=.*/DBPwd=$dbpw/g" \
> /etc/cabal/GlobalDBAgent.ini.tmp
mv /etc/cabal/GlobalDBAgent.ini.tmp /etc/cabal/GlobalDBAgent.ini

sed /etc/cabal/PCBangDBAgent.ini \
-e "s/.*DBId=.*/DBId=$dbuser/g" \
-e "s/.*DBPwd=.*/DBPwd=$dbpw/g" \
> /etc/cabal/PCBangDBAgent.ini.tmp
mv /etc/cabal/PCBangDBAgent.ini.tmp /etc/cabal/PCBangDBAgent.ini

FILES=/etc/cabal/DBAgent_*.ini
for f in $FILES
do
  sed $f \
-e "s/.*DBId=.*/DBId=$dbuser/g" \
-e "s/.*DBPwd=.*/DBPwd=$dbpw/g" \
  > $f.tmp
  mv $f.tmp $f
done

FILES=/etc/cabal/WorldSvr_*.ini
for f in $FILES
do
  sed $f \
  -e "s/cip/$cip/g" \
  -e "s/dbpw/$dbpw/g" \
  > $f.tmp
  mv $f.tmp $f
done
