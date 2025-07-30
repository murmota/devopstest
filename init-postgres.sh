#!/bin/bash
set -e

mkdir -p /var/lib/postgresql/data/logs/pglogs/$(date +%F)
chown -R postgres:postgres /var/lib/postgresql/data/logs/pglogs

mkdir -p /var/lib/postgresql/data/logs/applogs/$(date +%F)
chown -R postgres:postgres /var/lib/postgresql/data/logs/applogs

cat > /var/lib/postgresql/data/pg_hba.conf <<EOF
# TYPE  DATABASE        USER            ADDRESS                 METHOD
local   all             all                                     trust
host    all             all             0.0.0.0/0               trust
host    all             all             ::/0                    trust
EOF

exec docker-entrypoint.sh postgres
