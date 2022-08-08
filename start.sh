#!/bin/bash

docker-compose up -d mssql

docker-compose up -d global_db_agent auth_db_agent cash_db_agent event_db_agent pc_bang_db_agent db_agent_01 rock_and_roll_its

docker-compose up -d global_mgr_svr

echo "Wait loading Global Manager Server (30 secs)"
sleep 30

docker-compose up -d party_svr_01 chat_node_01 event_mgr_svr login_svr_01 agent_shop_01

docker-compose up -d world_svr_01_01
docker-compose up -d world_svr_01_02

docker-compose up -d world_svr_01_03 world_svr_01_04 world_svr_01_05 world_svr_01_06 world_svr_01_07
