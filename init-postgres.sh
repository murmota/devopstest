#!/bin/bash
set -e

mkdir -p ./logs/pg/$(date +%F)
chown -R postgres:postgres ./logs/pg

mkdir -p ./logs/app/$(date +%F)
chown -R postgres:postgres ./logs/app

cat > /var/lib/postgresql/data/pg_hba.conf <<EOF
# TYPE  DATABASE        USER            ADDRESS                 METHOD
local   all             all                                     trust
host    all             all             0.0.0.0/0               trust
host    all             all             ::/0                    trust
EOF

exec docker-entrypoint.sh postgres
