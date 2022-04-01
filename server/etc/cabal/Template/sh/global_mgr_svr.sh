#!/bin/sh

DB_AGENT_IP=$(dig global_db_agent +short)
GLOBAL_MGR_SVR_IP=$(hostname -I)

/opt/mssql-tools/bin/sqlcmd -S mssql -U SA -P $DB_PASSWORD -Q "USE [Authentication];UPDATE [dbo].[cabal_gmsauth_ip_table] SET [ipAddress] = '$GLOBAL_MGR_SVR_IP',[DBAgentAddress] = '$DB_AGENT_IP'"

exec /usr/bin/GlobalMgrSvr -l -c