#!/bin/sh

sqlcmd -S localhost -U SA -Q "RESTORE DATABASE [Account] FROM DISK = N'/var/opt/mssql/backup/Account.bak' WITH FILE = 1, NOUNLOAD, REPLACE, STATS = 5"
sqlcmd -S localhost -U SA -Q "RESTORE DATABASE [Authentication] FROM DISK = N'/var/opt/mssql/backup/Authentication.bak' WITH FILE = 1, NOUNLOAD, REPLACE, STATS = 5"
sqlcmd -S localhost -U SA -Q "RESTORE DATABASE [CabalCash] FROM DISK = N'/var/opt/mssql/backup/CabalCash.bak' WITH FILE = 1, NOUNLOAD, REPLACE, STATS = 5"
sqlcmd -S localhost -U SA -Q "RESTORE DATABASE [CabalGuild] FROM DISK = N'/var/opt/mssql/backup/CabalGuild.bak' WITH FILE = 1, NOUNLOAD, REPLACE, STATS = 5"
sqlcmd -S localhost -U SA -Q "RESTORE DATABASE [EventData] FROM DISK = N'/var/opt/mssql/backup/EventData.bak' WITH FILE = 1, NOUNLOAD, REPLACE, STATS = 5"
sqlcmd -S localhost -U SA -Q "RESTORE DATABASE [NetCafeBilling] FROM DISK = N'/var/opt/mssql/backup/NetCafeBilling.bak' WITH FILE = 1, NOUNLOAD, REPLACE, STATS = 5"
sqlcmd -S localhost -U SA -Q "RESTORE DATABASE [Server01] FROM DISK = N'/var/opt/mssql/backup/Server01.bak' WITH FILE = 1, NOUNLOAD, REPLACE, STATS = 5"
