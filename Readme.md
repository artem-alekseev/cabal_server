## Installing

## Docker

Install [Docker](https://www.docker.com/get-started)

### Environment

Copy .env.example to .env and configurate .env

Use a strong password for mssql with special symbols, numbers, and uppercase symbols

Otherwise, your container will not start.

## Database

```cmd
docker-compose up -d --build mssql
docker-compose exec mssql sh restoredb.sh
```

## Server

```cmd
docker-compose up -d --build global_db_agent auth_db_agent cash_db_agent event_db_agent pc_bang_db_agent db_agent_01 rock_and_roll_its
```

```cmd
docker-compose up -d --build global_mgr_svr
```
wait loading global_mgr_svr (~30 sec)

```cmd
docker-compose up -d --build party_svr_01 chat_node_01 event_mgr_svr login_svr_01 agent_shop_01
```

start world server (channels)

```cmd
docker-compose up -d --build world_svr_01_01
```
```cmd
docker-compose up -d --build world_svr_01_02
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