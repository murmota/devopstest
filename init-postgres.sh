#!/bin/bash
set -e

mkdir -p ./logs/pg/$(date +%F)
chown -R postgres:postgres ./logs/pg

mkdir -p ./logs/app/$(date +%F)
chown -R postgres:postgres ./logs/app

echo "host all all 0.0.0.0/0 trust" >> /var/lib/postgresql/data/pg_hba.conf

exec docker-entrypoint.sh postgres
