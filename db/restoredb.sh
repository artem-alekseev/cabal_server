#!/bin/sh

sqlcmd -S localhost -U SA -P "$SA_PASSWORD" -Q "CREATE DATABASE [Account];
CREATE DATABASE [Authentication];
CREATE DATABASE [CabalCash];
CREATE DATABASE [CabalGuild];
CREATE DATABASE [EventData];
CREATE DATABASE [NetCafeBilling];"

touch /var/opt/mssql/data/testing-server01.ldf
touch /var/opt/mssql/data/testing-server01.mdf

chown mssql /var/opt/mssql/data

sqlcmd -S localhost -U SA -P "$SA_PASSWORD" -Q "RESTORE DATABASE [Account] FROM DISK = N'/var/opt/mssql/backup/Account.bak' WITH FILE = 1, NOUNLOAD, REPLACE, STATS = 5;
RESTORE DATABASE [Authentication] FROM DISK = N'/var/opt/mssql/backup/Authentication.bak' WITH FILE = 1, NOUNLOAD, REPLACE, STATS = 5;
RESTORE DATABASE [CabalCash] FROM DISK = N'/var/opt/mssql/backup/CabalCash.bak' WITH FILE = 1, NOUNLOAD, REPLACE, STATS = 5;
RESTORE DATABASE [CabalGuild] FROM DISK = N'/var/opt/mssql/backup/CabalGuild.bak' WITH FILE = 1, NOUNLOAD, REPLACE, STATS = 5;
RESTORE DATABASE [EventData] FROM DISK = N'/var/opt/mssql/backup/EventData.bak' WITH FILE = 1, NOUNLOAD, REPLACE, STATS = 5;
RESTORE DATABASE [NetCafeBilling] FROM DISK = N'/var/opt/mssql/backup/NetCafeBilling.bak' WITH FILE = 1, NOUNLOAD, REPLACE, STATS = 5;
RESTORE DATABASE [Server01] FROM DISK = N'/var/opt/mssql/backup/Server01.bak' WITH FILE = 1, NOUNLOAD, REPLACE, STATS = 5;"