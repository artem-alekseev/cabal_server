## Installing

## Docker

Install [Docker](https://www.docker.com/get-started)

### Environment

Copy .env.example to .env and configurate .env

```
DB_PASSWORD=password_from_db //Use a strong password for mssql with special symbols, numbers, and uppercase symbols
CONNECT_IP=192.168.1.1 // IP server
EXP_RATE=100 // Enter EXP rate multiplier, e.g. 5 for 5x 
SEXP_RATE=100 // Enter Skill EXP rate multiplier
CEXP_RATE=100 // Enter Craft EXP rate multiplier
DROP_RATE=2 // Enter drop rate multiplier (over 5 is bad)
ALZ_RATE=100 // Enter Alz rate multiplier
BALZ_RATE=100 // Enter Alz bomb rate multiplier
PEXP_RATE=100 // Enter Pet EXP multiplier
WEXP_RATE=100 // Enter War EXP multiplier
ITEMS_PER_DROP=2 // Enter number of items per drop
```

Otherwise, your container will not start.

## Build containers
```cmd
docker-compose build
```
## Database

Up container
```cmd
docker-compose up -d mssql
```

Restore database
```cmd
docker-compose exec mssql sh restoredb.sh
```
## Server

Start database agents
```cmd
docker-compose up -d global_db_agent auth_db_agent cash_db_agent event_db_agent pc_bang_db_agent db_agent_01 rock_and_roll_its
```
Start Global Manager Server
```cmd
docker-compose up -d global_mgr_svr
```
Wait loading Global Manager Server (~20-30 sec)

Start other services

```cmd
docker-compose up -d party_svr_01 chat_node_01 event_mgr_svr login_svr_01 agent_shop_01
```

Start world server (channels)

Premium
```cmd
docker-compose up -d world_svr_01_01
```
War
```cmd
docker-compose up -d world_svr_01_02
```

Start M War channels (M War channels auto restart every 4 hours)
```cmd
docker-compose up -d world_svr_01_03 world_svr_01_04 world_svr_01_05 world_svr_01_06 world_svr_01_07
```

### Stop server
```cmd
docker-compose down
```

### Service status

```cmd
docker-compose ps
```

### Service logs

```cmd
docker-compose logs container_name
```
example
```cmd
docker-compose logs global_mgr_svr
```