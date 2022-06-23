#!/bin/sh

sqlcmd -S localhost -U SA -P "$SA_PASSWORD" -Q "CREATE DATABASE [Account];
CREATE DATABASE [Authentication];
CREATE DATABASE [CabalCash];
CREATE DATABASE [CabalGuild];
CREATE DATABASE [EventData];
CREATE DATABASE [NetCafeBilling];
CREATE DATABASE [AnderSystems];
CREATE DATABASE [Server01];"

chown mssql /var/opt/mssql/data

sqlcmd -S localhost -U SA -P "$SA_PASSWORD" -Q "RESTORE DATABASE [Account] FROM DISK = N'/var/opt/mssql/backup/Account.bak' WITH FILE = 1, NOUNLOAD, REPLACE, STATS = 5;
RESTORE DATABASE [Authentication] FROM DISK = N'/var/opt/mssql/backup/Authentication.bak' WITH FILE = 1, NOUNLOAD, REPLACE, STATS = 5;
RESTORE DATABASE [CabalCash] FROM DISK = N'/var/opt/mssql/backup/CabalCash.bak' WITH FILE = 1, NOUNLOAD, REPLACE, STATS = 5;
RESTORE DATABASE [CabalGuild] FROM DISK = N'/var/opt/mssql/backup/CabalGuild.bak' WITH FILE = 1, NOUNLOAD, REPLACE, STATS = 5;
RESTORE DATABASE [EventData] FROM DISK = N'/var/opt/mssql/backup/EventData.bak' WITH FILE = 1, NOUNLOAD, REPLACE, STATS = 5;
RESTORE DATABASE [NetCafeBilling] FROM DISK = N'/var/opt/mssql/backup/NetCafeBilling.bak' WITH FILE = 1, NOUNLOAD, REPLACE, STATS = 5;
RESTORE DATABASE [Server01] FROM  DISK = N'/var/opt/mssql/backup/Server01.bak' WITH  FILE = 1,  MOVE N'SERVER02' TO N'/var/opt/mssql/data/Server01.mdf',  MOVE N'SERVER02_log' TO N'/var/opt/mssql/data/Server01_log.ldf',  NOUNLOAD,  REPLACE,  STATS = 5;
RESTORE DATABASE [AnderSystems] FROM  DISK = N'/var/opt/mssql/backup/AnderSystems.bak' WITH  FILE = 1,  MOVE N'AnderSystems' TO N'/var/opt/mssql/data/AnderSystems.mdf',  MOVE N'AnderSystems_log' TO N'/var/opt/mssql/data/AnderSystems_log.ldf',  NOUNLOAD,  REPLACE,  STATS = 5;"