#!/bin/bash

cabal_create_server 1
cabal_create_chanel 1 1
cabal_create_chanel 1 2
cabal_create_chanel 1 3
cabal_create_chanel 1 4
cabal_create_chanel 1 5
cabal_create_chanel 1 6
cabal_create_chanel 1 7

config_db_passwd

exec "$@"