## Installing

### Docker

Install [Docker](https://www.docker.com/get-started)

### Environment

Copy .env.example to .env and configurate .env

Use a strong password for mssql with special symbols, numbers, and uppercase symbols

Otherwise, your container will not start.

### Database

```cmd
docker-compose up -d --build mssql
docker-compose exec mssql sh restoredb.sh //enter password db from .env
```

### Server

```cmd
docker-compose up -d --build server
```

If you don't use all chanels, comment 

```docker

RUN cabal_create_server 1
RUN cabal_create_chanel 1 1
#RUN cabal_create_chanel 1 2
#RUN cabal_create_chanel 1 3
#RUN cabal_create_chanel 1 4
#RUN cabal_create_chanel 1 5
#RUN cabal_create_chanel 1 6
#RUN cabal_create_chanel 1 7

```

in server/Dockerfile

### Service status

```cmd
docker-compose exec server ps -x
```