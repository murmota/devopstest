#!/bin/bash
set -e

mkdir -p ./logs/pg/$(date +%F)
chown -R postgres:postgres ./logs/pg

mkdir -p ./logs/app/$(date +%F)
chown -R postgres:postgres ./logs/app

exec docker-entrypoint.sh postgres
